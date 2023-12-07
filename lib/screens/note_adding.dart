import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:studentnot/db/db_functions/db_note_function.dart';
import 'package:studentnot/db/db_model/note_db.dart';
import 'package:studentnot/screens/notes_listview.dart';

class noteaddingscreen extends StatefulWidget {
  noteaddingscreen({super.key});

  @override
  State<noteaddingscreen> createState() => _noteaddingscreenState();
}

class _noteaddingscreenState extends State<noteaddingscreen> {
  final _notetitilecontroller = TextEditingController();
  final _chaptercontroller = TextEditingController();
  final _categoryController = TextEditingController();
  final List<File>? _imagelist = [];
  late List<PlatformFile>? _documentlists = [];
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
    'Snvironmental Management',
    'Geography',
    'Health Sciences',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
                  style: TextStyle(color: Colors.white,fontSize: 19),
                ))
          ],
          iconTheme: IconThemeData(color: Colors.white),
        ),
// ------------------------------------------------------------------------------
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_arrow,
          animatedIconTheme: IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          children: [
            SpeedDialChild(
              child:
                  const Icon(Icons.add_a_photo_outlined, color: Colors.white),
              backgroundColor: const Color.fromARGB(207, 13, 20, 78),
              onTap: () {
                pickImages();
              },
            ),
            SpeedDialChild(
                child: const Icon(
                  Icons.picture_as_pdf,
                  color: Colors.white,
                ),
                backgroundColor: const Color.fromARGB(207, 13, 20, 78),
                onTap: () {
                  pickFiless();
                })
          ],
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
                  height: 400,
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
                  height: 400,
                  width: 900,
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView.builder(
                    itemCount: _imagelist!.length,
                    itemBuilder: (context, index) {
                      final img = _imagelist![index];
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(onLongPress: () {
                          setState(() {
                            _imagelist!.removeAt(index);
                          });
                        },
                          child: Container(
                            height: 300,
                            width: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(
                                    image: FileImage(img), fit: BoxFit.fill)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
// -------------------------------------------file-list--------------------------------------------------------------------------------------------
                const SizedBox(
                  height: 40,
                ),
                const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "𝐃𝐎𝐂𝐔𝐌𝐄𝐍𝐓𝐒",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Container(
                  height: 400,
                  width: 900,
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView.builder(
                    itemCount: _documentlists!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            openFile(_documentlists![index]);
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: ListTile(
                              tileColor:
                                  Color.fromARGB(221, 130, 136, 147),
                              title: Text('${_documentlists![index].name}'),
                              subtitle: Text('${_documentlists![index].path}'),
                              trailing: IconButton(onPressed: (){setState(() {
                                _documentlists!.removeAt(index);
                              });}, icon:Icon(Icons.close)),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // image picking function--------------------------------------------------
  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImages != null) {
      final imageFile = File(pickedImages.path); // Convert XFile to File
      setState(() {
        _imagelist!.add(imageFile);
      });
    }
  }

  void pickFiless() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
      allowMultiple: true,
    );

    if (result != null && result.files.isNotEmpty) {
      setState(() {
        _documentlists = result.files;
      });
    }
  }

  Future<void> openFile(PlatformFile file) async {
    final filePath = file.path;
    final fileName = file.name;

    try {
      await OpenFile.open(filePath);
      print(fileName);
    } catch (error) {
      print(error);
    }
  }

  // ------save button function--------------------------------------
  Future<void> onAddNoteOnClick(BuildContext context) async {
    final _notetile = _notetitilecontroller.text.trim();
    final _chapt = _chaptercontroller.text.trim();
    final _category = _categoryController.text.trim();
    if (_notetile.isEmpty || _chapt.isEmpty || _category.isEmpty) {
      return;
    } else {
      final note1 = notesData(
          notetitle: _notetile,
          note: _chapt,
          documentlist: _documentlists,
          imagelists: _imagelist,
          category: _category);
      addnote(note1);
      _notetitilecontroller.clear();
      _chaptercontroller.clear();
      _categoryController.clear();
      _imagelist!.clear();
      _documentlists!.clear();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NotelistViewScreen(
                selectedsub: selectedsub,
              )));
    }
  }
}
