import 'dart:io';
import 'package:flutter/material.dart';
import 'package:studentnot/widget/bottombar.dart';

class NoteViewScreen extends StatefulWidget {
  final String notetitle;
  final String note;
  final String catogery;
  final List imagelists;
  int index;

  NoteViewScreen({
    super.key,
    required this.notetitle,
    required this.note,
    required this.catogery,
    required this.imagelists,
    required this.index,
  });

  @override
  State<NoteViewScreen> createState() => _NoteViewScreenState();
}

class _NoteViewScreenState extends State<NoteViewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const BottomBar(username: ''),
              ));
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          title: Text(widget.notetitle, style: const TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.note,
                    style: const TextStyle(fontSize: 20),
                  ),
                  if (widget.imagelists.isNotEmpty)
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Images:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.imagelists.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.file(
                                  File(widget.imagelists[index]),
                                  width: 500,
                                  height: 300,
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}