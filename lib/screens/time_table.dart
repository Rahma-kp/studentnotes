import 'package:flutter/material.dart';

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
      ),
    );
  }
}