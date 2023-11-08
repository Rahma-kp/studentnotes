import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:studentnot/db/db_model/note_dbmodel.dart';
import 'package:studentnot/screens/notes_listview.dart';
import 'package:studentnot/widget/common.dart';

class noteEditingScreen extends StatefulWidget {
  const noteEditingScreen({super.key});

  @override
  State<noteEditingScreen> createState() => _noteEditingScreenState();
}

class _noteEditingScreenState extends State<noteEditingScreen> {
   final _notecontroller = TextEditingController();
  final _chaptercontroller=TextEditingController();
  late List<File> imagelist = [];
  late List<dynamic> documentlists = [];
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
      body:common(chaptercontroller: _chaptercontroller, notecontroller:_notecontroller, imagelist: imagelist, documentlists: documentlists, ),
 // ------------------------------------------------------
           
    );
  }
}
