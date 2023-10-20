import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


class add_screen extends StatelessWidget {
  const add_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(207, 13, 20, 78),
        title: Text("Add Subject"),
        elevation: 0,
        actions: [IconButton(onPressed: (){}, icon:Icon(Icons.more_vert))],),
        floatingActionButton: SpeedDial(animatedIcon: AnimatedIcons.menu_arrow,backgroundColor:  Color.fromARGB(207, 13, 20, 78),
        children: [
          SpeedDialChild(child: Icon(Icons.add_a_photo_outlined,color: Colors.white),backgroundColor: Color.fromARGB(207, 13, 20, 78), ),
          SpeedDialChild(child: Icon(Icons.picture_as_pdf,color: Colors.white,),backgroundColor:Color.fromARGB(207, 13, 20, 78),)
        ],),
      
        );
  }
}