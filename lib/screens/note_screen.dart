import 'dart:io';
import 'package:flutter/material.dart';

class noteViewScreen extends StatefulWidget {
  final String notetitle;
  final String note;
  final String catogery;
  final List documentlist;
  final List imagelists;
  int index;

  noteViewScreen({
    Key? key,
    required this.notetitle,
    required this.note,
    required this.catogery,
    required this.documentlist,
    required this.imagelists,
    required this.index,
  }) : super(key: key);

  @override
  State<noteViewScreen> createState() => _noteViewScreenState();
}

class _noteViewScreenState extends State<noteViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          title: Text(widget.notetitle, style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.note, //note---------------
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    if (widget.documentlist.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Documents:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                widget.documentlist.length,
                                (index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Document ${index + 1}: ${widget.documentlist[index]}',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (widget.imagelists.isNotEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Images:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 300, // Set a specific height if needed
                            child: ListView.builder(
                              shrinkWrap: true, // Add this line
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
                          ),
                        ],
                      ),
                  ]),
            ),
          ),
        ));
  }
}
