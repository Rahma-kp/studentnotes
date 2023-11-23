import 'dart:io';
import 'package:flutter/material.dart';
import 'package:studentnot/db/db_model/note_db.dart';
import 'package:studentnot/widget/common.dart';

class noteViewScreen extends StatefulWidget {
  final String notetitle;
  final String note;
  final String catogery;
  final List documentlist;
  final List imagelists;
  int index;
  noteViewScreen(
      {super.key,
      required this.notetitle,
      required this.note,
      required this.catogery,
      required this.documentlist,
      required this.imagelists,
      required this.index});

  @override
  State<noteViewScreen> createState() => _noteViewScreenState();
}

class _noteViewScreenState extends State<noteViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        title: Text(widget.notetitle, style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Column(
          children: [Padding(
            padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
            child: Text(widget.note,style: TextStyle(fontSize: 20),),
          )]),
      ),
    );
  }
}
