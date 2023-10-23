import 'package:flutter/material.dart';
import 'package:studentnot/drawer.dart';
import 'package:studentnot/screens/notes_listview.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(leading: CircleAvatar(backgroundImage: AssetImage("assets/images/person.jpeg")),
          title: Text("Adil"),
          elevation: 0,backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        ),
        endDrawer: const drawer(),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(207, 13, 20, 78),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30,right: 30),
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white60,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black54,
                          ),
                          hintText: "Search...."),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20,top: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Subjects",
                    style: TextStyle(fontSize: 25,fontWeight:  FontWeight.bold),
                  )),
            ),
            const SizedBox(height: 10,),
            SingleChildScrollView(scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 10,),
                GestureDetector(onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const listview_screen(),)),
                  child: sub(head: "Mathematics", about:"Mathematics is a education of numbers and shpes")),
                  const SizedBox(width: 10,),
                sub(head: "zoology", about: "Zoology is the branch of biology concerned with the study animals and animal kingdom"),
                const SizedBox(width: 10,),
                sub(head: "Botany", about: "branch of biology that deals with the study of plants, including their struct"),
                const SizedBox(width: 10,)
              ],),
            ),
            const SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection:Axis.horizontal ,
              child: Row( 
                children: [
                  const SizedBox(width: 10,),
                  sub(head: "English", about:"English, which originated in early medieval England, is a West Germanic language "),
                  const SizedBox(width: 10,),
                  sub(head: "Computer", about: "A computer is a machine or device performs processes, "),
                  const SizedBox(width: 10,),
                  sub(head: "History", about: "History is the study of change over time, and it covers all aspects of human society."),
                  const SizedBox(width: 10,),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row( 
                children: [
                  const SizedBox(width: 10,),
                sub(head: "Chemistry", about:"Chemistry is a branch of natural science that deals principally with the properties of subst"),
                const SizedBox(width: 10,),
                sub(head: "physics", about: "Physics is the natural science of matter, involving the study of matter,"),
                const SizedBox(width: 10,),
                sub(head: "Sociology", about: "Sociology is a social science that focuses on society, human social behavior, "),
                const SizedBox(width: 10,),
              ],),
            ),
          ]),
        ),
      ),
    );
  }

  Container sub({required String head,required String about}) {
    return Container(height:150,width: 150,decoration: const BoxDecoration(color: Color.fromARGB(255, 147, 143, 143),
              borderRadius: BorderRadius.all(Radius.circular(20))),child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Text(head,style: const TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  Text(about,style: const TextStyle(fontSize:15),)
                ]),
              ),);
  }
}
