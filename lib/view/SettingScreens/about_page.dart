import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          title: const Text(
            "𝐀𝐛𝐨𝐮𝐭",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(''' 
       Welcome to the Mynote! 

             

  A Mynote app  designed to versatile and user-friendly tool designed to simplify the process of capturing and organizing thoughts and notes
  Users can seamlessly create, edit, and categorize notes, making it an ideal solution for a variety of purposes.
  The app accommodates both text and image content, allowing users to express themselves creatively and comprehensively. Whether users are jotting down daily reflections, recording lecture notes, or saving important information, your note app provides a flexible platform to suit diverse needs.

             

Mnyote app stands as a versatile and user-centric solution for efficient information management







                               Explore the features ! ''')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
