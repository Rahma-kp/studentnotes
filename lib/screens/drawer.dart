import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
       CircleAvatar(
        radius: 40,
        backgroundImage: AssetImage("assets/images/person.jpeg"),),
        ListTile()
    ],);
  }
}