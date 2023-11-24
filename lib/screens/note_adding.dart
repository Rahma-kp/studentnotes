import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
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
  final _chaptercontroller=TextEditingController();
  final _categoryController = TextEditingController();
  late List<File> _imagelist = [];
  late List<dynamic> _documentlists = [];
  String selectedsub = 'subjects';

  final List<String> _sujectList = ['subjects','ENGLISH', 'PHYSICS', 'MATH'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          title: const Text("Add chapter",style: TextStyle(color: Colors.white),),
          actions: [
            TextButton(
                onPressed: () {
                 onAddNoteOnClick(context);
                },
                child: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
// ------------------------------------------------------------------------------
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_arrow,
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          children: [
            SpeedDialChild(
              child: const Icon(Icons.add_a_photo_outlined, color: Colors.white),
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
                pickDocuments();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 TextFormField(
                            controller:_notetitilecontroller,
                            style: const TextStyle(
                              fontSize:35,
                              fontWeight: FontWeight.bold
                            ),
                            decoration: const InputDecoration(
                              hintText: "Title",
                              border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select the category',
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
                 const SizedBox(height: 30,),
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
                  width: 500,
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
                  width: 500,
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView.builder(
                    itemCount: _imagelist.length,
                    itemBuilder: (context, index) {
                      final img =_imagelist[index];
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: FileImage(img), fit: BoxFit.fill)),
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
                  width: 500,
                  decoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView.builder(
  itemCount: _documentlists.length,
  itemBuilder: (context, index) {
    final dmc = _documentlists[index];
    print('Document Path: ${dmc.path}');
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GestureDetector(
        child: PDFView(filePath: dmc.path),
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
  // image picking function--------------------------------------------------
  Future<void> pickImages() async {
    final picker = ImagePicker();
    final pickedImages = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImages != null) {
      final imageFile = File(pickedImages.path); // Convert XFile to File
      setState(() {
       _imagelist.add(imageFile);
      });
    }
  }
// file picking function--------------------------------------------------------
  Future<void> pickDocuments() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true, // Allow multiple file selection
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx', 'txt'],
    );

    if (result != null) {
      setState(() {
        _documentlists = result.files;
      });
    }
  }
 // ------save button function--------------------------------------
  Future<void> onAddNoteOnClick(BuildContext context) async {
    final _notetile = _notetitilecontroller.text.trim();
    final _chapt = _chaptercontroller.text.trim();
    final _category=_categoryController.text.trim();
    if (_notetile.isEmpty || _chapt.isEmpty||_category.isEmpty) {
      return;
    } else {
      final note1 = notesData(notetitle:_notetile,note: _chapt,documentlist:_documentlists,imagelists: _imagelist, category:_category);
      addnote(note1);
      _notetitilecontroller.clear();
      _chaptercontroller.clear();
      _categoryController.clear();
      _imagelist.clear();
      _documentlists.clear();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotelistViewScreen(selectedsub: selectedsub,)));
    }
  }
}