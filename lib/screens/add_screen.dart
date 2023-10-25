import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:studentnot/screens/home_screen.dart';

class add_screen extends StatelessWidget {
  const add_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          title: const Text("Add Subject"),
          elevation: 0,
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_arrow,
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          children: [
            SpeedDialChild(
              child:
                  const Icon(Icons.add_a_photo_outlined, color: Colors.white),
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
        body: Center(
          child: Column(children: [
            const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                              children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Subject",
                          hintStyle: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),
                          border:
                              UnderlineInputBorder(borderSide: BorderSide.none)),
                      style: TextStyle(fontSize: 35, color: Color.fromARGB(255, 99, 96, 96),fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30, right: 20),
                    child: TextField(keyboardType: TextInputType.multiline,
                    maxLines: null,
                        style: TextStyle(fontSize:25,color:Color.fromARGB(255, 99, 96, 96) ),
                        decoration: InputDecoration(
                            hintText: "About",
                            border: UnderlineInputBorder(
                                borderSide: BorderSide.none))),
                  )
                              ],
                            ),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FloatingActionButton.extended(
                  backgroundColor: const Color.fromARGB(207, 13, 20, 78),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => home_screen(),
                    ));
                  },
                  label: const Text("Save")),
            )
          ]),
        ),
      ),
    );
  }
}
