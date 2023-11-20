import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studentnot/db/db_model/note_db.dart';
import 'package:studentnot/widget/common.dart';

class noteViewScreen extends StatefulWidget {

  noteViewScreen(
      {super.key});

  @override
  State<noteViewScreen> createState() => _noteViewScreenState();
}

class _noteViewScreenState extends State<noteViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        title:Text("vbnm",style: TextStyle(color: Colors.white)),
      ),
      body: Column(children: [
        Text("sdfgh")
      ]),
    );
  }
}
