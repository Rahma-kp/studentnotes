import 'package:flutter/material.dart';

class time_table extends StatelessWidget {
  const time_table({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(207, 13, 20, 78), elevation: 0,
      title: Text("Time-table"),),
      floatingActionButton: FloatingActionButton(onPressed: (){},
      child: Icon(Icons.edit),backgroundColor:  Color.fromARGB(207, 13, 20, 78),),
    );
  }
}