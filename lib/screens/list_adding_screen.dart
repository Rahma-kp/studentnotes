import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:studentnot/screens/notes_listview.dart';

class list_adding_screen extends StatelessWidget {
   list_adding_screen({super.key});
  final _notecontroller=TextEditingController();

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
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Column(
                  children: [
                    Expanded(child:
                    TextFormField(
                          controller: _notecontroller,
                          keyboardType: TextInputType.multiline,
                          maxLines:700,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            hintText: "Start writing..........",
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
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
    
            ),
    );
    
  }
}