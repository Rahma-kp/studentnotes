import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:studentnot/db/db_model/note_db.dart';
import 'package:studentnot/screens/notes_listview.dart';
import 'package:studentnot/widget/common.dart';

class noteEditingScreen extends StatefulWidget {
  final String notetitle;
  final String note;
  final String Category;
  final List imagelist;
  final List documentlists;
  int index;
  noteEditingScreen(
      {super.key,
      required this.notetitle,
      required this.note,
      required this.Category,
      required this.documentlists,
      required this.imagelist,
      required this.index});

  @override
  State<noteEditingScreen> createState() => _noteEditingScreenState();
}

class _noteEditingScreenState extends State<noteEditingScreen> {
  TextEditingController _notetitilecontroller=TextEditingController();
  TextEditingController __chaptercontrolle=TextEditingController();
  TextEditingController _categoryController = TextEditingController();
  late List<File> imagelist = [];
  late List<dynamic> documentlists = [];
  final List<String> _sujectList = ['eng', 'phy', 'maths'];
  String selectedsub = 'subjects';
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 158, 156, 156),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        title: const Text("Edit"),
      ),
      floatingActionButton: SpeedDial(
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
                style:
                    const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
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
                          controller: _notetitilecontroller,
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
                width: 500,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: __chaptercontrolle,
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
                  itemCount: imagelist.length,
                  itemBuilder: (context, index) {
                    final img = imagelist[index];
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
                  itemCount: documentlists.length,
                  itemBuilder: (context, index) {
                    final dmc = documentlists[index];
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                          child: PDFView(
                        filePath: dmc.path,
                      )),
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
}
