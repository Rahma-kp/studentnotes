import 'package:flutter/material.dart';
import 'package:flutter_timetable/flutter_timetable.dart';

class time_table extends StatelessWidget {
  const time_table({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor: const Color.fromARGB(207, 13, 20, 78), elevation: 0,
        title: const Text("Time-table"),),
        floatingActionButton: FloatingActionButton(onPressed: (){},
        child: const Icon(Icons.edit),backgroundColor:  const Color.fromARGB(207, 13, 20, 78),),
        body:Timetable(items: [ ]),
      ),
    );
  }
}