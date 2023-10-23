import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:studentnot/screens/notes_listview.dart';

class list_adding_screen extends StatelessWidget {
  const list_adding_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: AppBar(backgroundColor:Color.fromARGB(207, 13, 20, 78),
      title: Text("Add chapter"), ),
        floatingActionButton: SpeedDial(animatedIcon: AnimatedIcons.menu_arrow,backgroundColor:  Color.fromARGB(207, 13, 20, 78),
            children: [
              SpeedDialChild(child: Icon(Icons.add_a_photo_outlined,color: Colors.white),backgroundColor: Color.fromARGB(207, 13, 20, 78), ),
              SpeedDialChild(child: Icon(Icons.picture_as_pdf,color: Colors.white,),backgroundColor:Color.fromARGB(207, 13, 20, 78),)
            ],),
            body: Center(
              child: Column(
                children: [
                  Expanded(child:
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        
                      ],
                    ),
                  ) ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: FloatingActionButton.extended(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => listview_screen(),));
                    }, label:Text("Save"),backgroundColor:Color.fromARGB(207, 13, 20, 78) ,),
                  )
                ],
              ),
            ),
    
            ),
    );
    
  }
}