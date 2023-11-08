import 'dart:io';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentnot/db/db_functions/db_note_function.dart';
import 'package:studentnot/db/db_model/data_model.dart';
import 'package:studentnot/db/db_model/note_dbmodel.dart';
import 'package:studentnot/screens/notes_listview.dart';
import 'package:studentnot/widget/common.dart';

class noteAddingScreen extends StatefulWidget {
  final List<subdata>subtitles;

  noteAddingScreen({Key? key,required this.subtitles}): super(key:key);

  @override
  State<noteAddingScreen> createState() => _noteAddingScreenState();
}

class _noteAddingScreenState extends State<noteAddingScreen> {
  final _notecontroller = TextEditingController();
  final _chaptercontroller=TextEditingController();
  late List<File> imagelist = [];
  late List<dynamic> documentlists = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(207, 13, 20, 78),
          title: Text("Add chapter"),
          actions: [
            TextButton(
                onPressed: () {
                 onAddNoteOnClick(context);
                },
                child: Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
// ------------------------------------------------------------------------------
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_arrow,
          backgroundColor: Color.fromARGB(207, 13, 20, 78),
          children: [
            SpeedDialChild(
              child: Icon(Icons.add_a_photo_outlined, color: Colors.white),
              backgroundColor: Color.fromARGB(207, 13, 20, 78),
              onTap: () {
                pickImages();
              },
            ),
            SpeedDialChild(
              child: Icon(
                Icons.picture_as_pdf,
                color: Colors.white,
              ),
              backgroundColor: Color.fromARGB(207, 13, 20, 78),
              onTap: () {
                pickDocuments();
              },
            )
          ],
        ),
        body: common(chaptercontroller: _chaptercontroller, notecontroller: _notecontroller, imagelist: imagelist, documentlists: documentlists),
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
        imagelist.add(imageFile);
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
        documentlists = result.files;
      });
    }
  }
 // ------save button function--------------------------------------
  Future<void> onAddNoteOnClick(BuildContext context) async {
    final _notetile = _notecontroller.text.trim();
    final _chapt = _chaptercontroller.text.trim();
    if (_notetile.isEmpty || _chapt.isEmpty) {
      return;
    } else {
      final note1 = notesData(notetitle:_notetile,note: _chapt,documentlist: documentlists,imagelists: imagelist);
      addnote(note1);
      _notecontroller.clear();
      _chaptercontroller.clear();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NotelistViewScreen(note1: notesData(notetitle: '')),));
    }
  }
}

