import 'package:flutter/material.dart';
import 'package:studentnot/screens/notes_listview.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromARGB(207, 13, 20, 78),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage("assets/images/person.jpeg"),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 400,
                  child: Padding(
                    padding: EdgeInsets.only(left: 30,right: 30),
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white60,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black54,
                          ),
                          hintText: "Search...."),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    Text(
                      "Hai,",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    Text(
                      "Rahma",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    )
                  ],
                )
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20,top: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Subjects",
                    style: TextStyle(fontSize: 25),
                  )),
            ),
            SizedBox(height: 10,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              GestureDetector(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => listview_screen(),)),
                child: sub(head: "Mathematics", about:"Mathematics is a education of numbers and shpes")),
              sub(head: "zoology", about: "Zoology is the branch of biology concerned with the study animals and animal kingdom"),
              sub(head: "Botany", about: "branch of biology that deals with the study of plants, including their struct")
            ],),
            SizedBox(height: 10,),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                sub(head: "English", about:"English, which originated in early medieval England, is a West Germanic language "),
                sub(head: "Computer", about: "A computer is a machine or device performs processes, "),
                sub(head: "History", about: "History is the study of change over time, and it covers all aspects of human society.")
              ],
            ),
            SizedBox(height: 10,),
            Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              sub(head: "Chemistry", about:"Chemistry is a branch of natural science that deals principally with the properties of subst"),
              sub(head: "physics", about: "Physics is the natural science of matter, involving the study of matter,[a] its fundamental constituents,"),
              sub(head: "Sociology", about: "Sociology is a social science that focuses on society, human social behavior, patterns of social relationships")
            ],)
          ]),
        ),
      ),
    );
  }

  Container sub({required String head,required String about}) {
    return Container(height:150,width: 150,decoration: BoxDecoration(color: const Color.fromARGB(255, 167, 146, 146),
              borderRadius: BorderRadius.all(Radius.circular(20))),child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(head,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                Text(about,style: TextStyle(fontSize:15),)
              ]),);
  }
}
