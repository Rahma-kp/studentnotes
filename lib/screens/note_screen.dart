import 'package:flutter/material.dart';

class note_screen extends StatelessWidget {
  const note_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor:Color.fromARGB(207, 13, 20, 78), ),
    body: Column(mainAxisAlignment: MainAxisAlignment.start,
      children: [
      SizedBox(height: 30,),
      Text("Chapter:1",style: TextStyle(fontSize: 30,color: Colors.black54),),
      SizedBox(height: 20,),
      SizedBox(width: 450,
        child: Text("Trigonometry,the branch of mathematics concerd whithin specific functions of ange and theri application of calculate"))
    ]),);
  }
}