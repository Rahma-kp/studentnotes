import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class list_adding_screen extends StatelessWidget {
  const list_adding_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor:Color.fromARGB(207, 13, 20, 78),
    title: Text(""), ),
      floatingActionButton: SpeedDial(animatedIcon: AnimatedIcons.menu_arrow,backgroundColor:  Color.fromARGB(207, 13, 20, 78),
          children: [
            SpeedDialChild(child: Icon(Icons.add_a_photo_outlined,color: Colors.white),backgroundColor: Color.fromARGB(207, 13, 20, 78), ),
            SpeedDialChild(child: Icon(Icons.picture_as_pdf,color: Colors.white,),backgroundColor:Color.fromARGB(207, 13, 20, 78),)
          ],),
          );
    
  }
}