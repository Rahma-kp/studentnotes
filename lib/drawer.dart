// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.grey,
      elevation: 10,
      child: Column(children: [
        SizedBox(height: 30),
        CircleAvatar(radius: 70,
        backgroundImage: AssetImage("assets/images/person.jpeg")),
        ListTile(
          leading: Text("Name:",style: TextStyle(fontSize: 20),),
          title: Text("Adil",style: TextStyle(fontSize: 20)),
        ),
         ListTile(
          leading: Text("Class:",style: TextStyle(fontSize: 20),),
          title: Text("10 th",style: TextStyle(fontSize: 20)),
        ),
        FloatingActionButton(onPressed: (){},child: Icon(Icons.edit),backgroundColor:Color.fromARGB(207, 13, 20, 78),)
      ]),
    );
    
  }
}