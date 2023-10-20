

import 'package:flutter/material.dart';
import 'package:studentnot/screens/notes_listview.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:listview_screen(),
    );
  }
}