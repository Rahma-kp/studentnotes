import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:studentnot/screens/notes_listview.dart';

class editing_screen extends StatelessWidget {
  const editing_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        title: const Text("Edit"),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_arrow,
        backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        children: [
          SpeedDialChild(
            child: const Icon(Icons.add_a_photo_outlined, color: Colors.white),
            backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          ),
          SpeedDialChild(
            child: const Icon(
              Icons.picture_as_pdf,
              color: Colors.white,
            ),
            backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                "Chapter:1",
                style: TextStyle(fontSize: 30, color: Colors.black54),
                  ),
                  const SizedBox(
                height: 20,
                  ),
                  const Text(
                  "Trigonometry,the branch of mathematics concerd whithin specific functions of ange and theri application of calculate"),
                ],
              ),
            )),
           FloatingActionButton.extended(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => listview_screen(),));
           }, label:Text("Save"),backgroundColor:Color.fromARGB(207, 13, 20, 78),)
          ],
        ),
      ),
    );
  }
}
