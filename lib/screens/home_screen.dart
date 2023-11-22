import 'package:flutter/material.dart';
import 'package:studentnot/db/db_functions/db_functions.dart';
import 'package:studentnot/db/db_model/data_model.dart';
import 'package:studentnot/db/db_model/note_db.dart';
import 'package:studentnot/drawer.dart';
import 'package:studentnot/screens/notes_listview.dart';

class homeScreen extends StatefulWidget {
  homeScreen({
    Key? key,
    required subdata sub1,
  }) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List<String> subject = ['ENGLISH', 'PHYSICS', 'MATH'];

  List<String> filteredsubject = [];

  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    filteredsubject = subject;
    super.initState();
  }

  void filterSubjects(String query) {
    setState(() {
      filteredsubject = subject
          .where(
              (subject) => subject.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/person.jpeg")),
          ),
          title: Text(
            "Adil",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        ),
        endDrawer: const drawer(),
        body: SingleChildScrollView(
          child: Column(children: [
            // containe the half part--------------------------------------------------------------------------------------
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
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      controller: searchController,
                      onChanged: (value) {
                        filterSubjects(value);
                      },
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
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Subjects",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
            ),
//  grid view code----------------------------------------------------------------------------------------------
            Builder(builder: (context) {
              return Container(
                height: 500,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemCount: filteredsubject.length,
                  itemBuilder: (context, index) {
                    if(filteredsubject.isEmpty){
                      return Center(child: Text("no subjects found"));
                    }
                    else{
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: GestureDetector(
                        onTap: () {
                          String selectedsub = filteredsubject[index];
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => NotelistViewScreen(
                                    note1: notesData(
                                        notetitle: "",
                                        note: "",
                                        category: selectedsub,
                                        documentlist: [],
                                        imagelists: []),
                                    selectedsub: selectedsub,
                                  )));
                        },
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 147, 143, 143),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Title(
                                    color: Colors.black,
                                    child: Text(
                                      subject[index],
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                    }
                  },
                ),
              );
            })
          ]),
        ),
      ),
    );
  }
}
