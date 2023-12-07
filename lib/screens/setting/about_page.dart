import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(iconTheme: IconThemeData(color: Colors.white),
        title: Text('About',style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(207, 13, 20, 78),),
      body: Column(
        children: [
          
        ],
      ),

    );
  }
}