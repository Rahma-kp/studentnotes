import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentnot/functions/note_function.dart';
import 'package:studentnot/model/note_model.dart';
import 'package:studentnot/screens/notesscreens/notes_listview.dart';
import 'package:studentnot/widget/bottombar.dart';

class NoteAdding extends StatefulWidget {
  const NoteAdding({super.key});

  @override
  State<NoteAdding> createState() => _NoteAddingState();
}

class _NoteAddingState extends State<NoteAdding> {
  final _notetitilecontroller = TextEditingController();
  final _chaptercontroller = TextEditingController();
  final _categoryController = TextEditingController();
  final List<String> _imagelist = [];
  String selectedsub = 'SUBJECTS';
  final List<String> _sujectList = [
    'SUBJECTS',
    'Language',
    'English',
    'Physics',
    'Mathematics',
    'Chemistry',
    'Social Science',
    'Biology',
    'Zoology',
    'Botany',
    'Computer',
    'Environmental',
    'Geography',
    'Health Sciences',
    'Entrepreneurship',
    'Arts',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BottomBar(username: '',imagePaths: ''),
              ));
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          title: const Text(
            "𝐀𝐝𝐝 𝐂𝐡𝐚𝐩𝐭𝐞𝐫",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                onAddNoteOnClick(context);
              },
              child: const Text(
                "𝐒𝐚𝐯𝐞",
                style: TextStyle(color: Colors.white, fontSize: 19),
              ),
            )
          ],
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        // ---------------------------floating button---------------------------------------------------
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          onPressed: () {
            pickImages();
          },
          child: const Icon(Icons.add_a_photo, color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _notetitilecontroller,
                  style: const TextStyle(
                      fontSize: 35, fontWeight: FontWeight.bold),
                  decoration: const InputDecoration(
                    hintText: "𝐓𝐢𝐭𝐥𝐞",
                    border: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '𝐒𝐞𝐥𝐞𝐜𝐭 𝐒𝐮𝐛𝐣𝐞𝐜𝐭',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextFormField(
                            controller: _categoryController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        DropdownButton<String>(
                          value: selectedsub,
                          items: _sujectList.map((e) {
                            return DropdownMenuItem<String>(
                              value: e,
                              child: Row(
                                children: [
                                  const SizedBox(width: 10),
                                  Text(e, style: const TextStyle(fontSize: 18)),
                                ],
                              ),
                            );
                          }).toList(),
                          selectedItemBuilder: (BuildContext context) {
                            return _sujectList.map((e) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const SizedBox(width: 10),
                                  Text(e, style: const TextStyle(fontSize: 18)),
                                ],
                              );
                            }).toList();
                          },
                          hint: const Text(
                            'Select',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                          dropdownColor: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          underline: Container(),
                          onChanged: (value) {
                            setState(() {
                              selectedsub = value!;
                              _categoryController.text = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "𝐍𝐎𝐓𝐄𝐒",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  height: 600,
                  width: 700,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _chaptercontroller,
                      keyboardType: TextInputType.multiline,
                      maxLines: 20,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      decoration: const InputDecoration(
                        hintText: "Start writing.........",
                        border: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                // ---------------------------------------------imagelist------------------------------------------------------------------------
                const SizedBox(
                  height: 40,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "𝐈𝐌𝐀𝐆𝐄𝐒",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Container(
                  height: 600,
                  width: 900,
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView.builder(
                    itemCount: _imagelist.length,
                    itemBuilder: (context, index) {
                      final img = _imagelist[index];
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onLongPress: () {
                            setState(() {
                              _imagelist.removeAt(index);
                            });
                          },
                          child: Container(
                            height: 300,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: FileImage(File(img)),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ----------------------image picking function--------------------------------------------------
  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImages != null) {
      final imageFile = File(pickedImages.path);
      final imagePath = imageFile.path;
      setState(() {
        _imagelist.add(imagePath);
      });
    }
  }

// -----------------save-button-function--------------------------------------
  Future<void> onAddNoteOnClick(BuildContext context) async {
    final notetile = _notetitilecontroller.text.trim();
    final chapt = _chaptercontroller.text.trim();
    final category = _categoryController.text.trim();
    final imge = _imagelist.toList();
    if (notetile.isEmpty || chapt.isEmpty || category.isEmpty) {
      return;
    } else {
      final note1 = NotesData(
          notetitle: notetile,
          note: chapt,
          imagelists: imge,
          category: category);
      _notetitilecontroller.clear();
      _chaptercontroller.clear();
      _categoryController.clear();
      addnote(note1);
      setState(() {
        _imagelist.clear(); // Clear the image list after adding a note.
      });
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => NotelistViewScreen(
                selectedsub: selectedsub,
                imagelistss: imge,
              )));
    }
  }
}
