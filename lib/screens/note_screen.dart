import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studentnot/widget/common.dart';

class noteViewScreen extends StatefulWidget {
  const noteViewScreen({super.key});

  @override
  State<noteViewScreen> createState() => _noteViewScreenState();
}

class _noteViewScreenState extends State<noteViewScreen> {
  final _notecontroller = TextEditingController();
  final _chaptercontroller = TextEditingController();
  late List<File> imagelist = [];
  late List<dynamic> documentlists = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("sdfghjk"),
        backgroundColor: const Color.fromARGB(207, 13, 20, 78),
      ),
     
    );
  }
}
