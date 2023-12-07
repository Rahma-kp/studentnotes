import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:studentnot/db/db_functions/db_note_function.dart';
import 'package:studentnot/db/db_model/note_db.dart';

class NotEditingScreen extends StatefulWidget {
  final String notetitle;
  final String note;
  final String catogery;
  final List documentlist;
  final List imagelists;
  int index;
  NotEditingScreen(
      {required this.notetitle,
      required this.note,
      required this.catogery,
      required this.documentlist,
      required this.imagelists,
      required this.index});

  @override
  State<NotEditingScreen> createState() => _NotEditingScreenState();
}

class _NotEditingScreenState extends State<NotEditingScreen> {
  TextEditingController _notetitilecontroller = TextEditingController();
  TextEditingController _chaptercontrolle = TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  final List<File> _imagelist = [];
  final List<dynamic> _documentlists = [];
  final List<String> _sujectList = [
    'SUBJECTS',
    'LANGUAGE',
    'ENGLISH',
    'PHYSICS',
    'MATHEMATICS',
    'CHEMISTRY',
    'SOCIAL SCIENCE',
    'BIOLOGY',
    'ZOOLOGY',
    'BOTANY'
  ];
  String selectedsub = 'SUBJECTS';

  @override
  void initState() {
    _notetitilecontroller = TextEditingController(text: widget.notetitle);
    _chaptercontrolle = TextEditingController(text: widget.note);
    _categoryController = TextEditingController(text: widget.catogery);
    _imagelist.addAll(widget.imagelists.cast<File>());
    _documentlists.addAll(widget.documentlist);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 158, 156, 156),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        title: const Text("Edit", style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
              onPressed: () {
                setState(() {
                  EditSaveOnclick();
                });
              },
              child: Text(
                "Save",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      floatingActionButton: SpeedDial(
        animatedIconTheme: IconThemeData(color: Colors.white),
        animatedIcon: AnimatedIcons.menu_arrow,
        backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        children: [
          SpeedDialChild(
            child: const Icon(Icons.add_a_photo_outlined, color: Colors.white),
            backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          ),
          SpeedDialChild(
            child: const Icon(
              Icons.picture_as_pdf,
              color: Colors.white,
            ),
            backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                style: const TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
                controller: _notetitilecontroller,
                decoration: const InputDecoration(
                  hintText: "Titile",
                  border: UnderlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select the subject',
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
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 400,
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _chaptercontrolle,
                    keyboardType: TextInputType.multiline,
                    maxLines: 20,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
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
                ),
              ),
              Container(
                height: 400,
                width: 500,
                decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                      height: 200,
                      width: 200,
                      child: ListView.builder(
                        itemCount: _imagelist.length,
                        itemBuilder: (context, index){
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: FileImage(_imagelist[index]))),
                            ),
                          );
                        },
                      )),
                ),
              ),
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
                ),
              ),
              Container(
                height: 400,
                width: 500,
                decoration: BoxDecoration(
                  border: Border.all(style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView.builder(
                  itemCount: _documentlists.length,
                  itemBuilder: (context, index) {
                    final dmc = _documentlists[index];
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        child: PDFView(
                          filePath: dmc.path,
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
    );
  }

  EditSaveOnclick() async {
    final editedTitile = _notetitilecontroller.text.trim();
    final editedNote = _chaptercontrolle.text.trim();
    final editedCategoery = _categoryController.text.trim();
    if (editedTitile.isEmpty || editedNote.isEmpty || editedCategoery.isEmpty) {
      return;
    }
    final updatedNonte = notesData(
        notetitle: editedTitile,
        note: editedNote,
        category: editedCategoery,
        documentlist: [],
        imagelists: []);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      margin: EdgeInsets.all(10),
      backgroundColor: Colors.grey,
      behavior: SnackBarBehavior.floating,
      content: Text("updated successfully"),
    ));

    editnote(widget.index, updatedNonte);
    Navigator.of(context).pop();
  }
}
