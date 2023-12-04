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
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(children: [
              Text(
                widget.note,
                style: TextStyle(fontSize: 20),
              ),
             const SizedBox(height: 20),
                if (widget.imagelists.isNotEmpty)
                  Text(
                    'Images:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                if (widget.imagelists.isNotEmpty)
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.imagelists.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.file(
                            File(widget.imagelists[index].path),
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
            ]),
          ),
        ),
      ),
    );
  }
}
