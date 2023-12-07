import 'package:flutter/material.dart';
import 'package:studentnot/screens/notes_listview.dart';

class HomeScreen extends StatefulWidget {
  //  final String username;
  const HomeScreen({Key? key,}) : super(key: key);
 

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> subject = [
    'LANGUAGE',
    'ENGLISH',
    'PHYSICS',
    'MATHEMATICS',
    'CHEMISTRY',
    'SOCIAL SCIENCE',
    'BIOLOGY',
    'ZOOLOGY',
    'BOTANY'
  ];

  List<String> catogry = [
    'assets/catogory/lang.jpg',
    'assets/catogory/eng.jpg',
    'assets/catogory/phy.jpg',
    'assets/catogory/math.jpg',
    'assets/catogory/ch.jpg',
    'assets/catogory/so.jpg',
    'assets/catogory/bio.jpg',
    'assets/catogory/zoo.jpg',
    'assets/catogory/botany.jpg',
    'assets/catogory/math.jpg',
  ];

  List<String> filteredsubject = [];

  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    filteredsubject = subject;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(221, 202, 194, 194),
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/person.jpeg"),
            ),
          ),
          title: Text(
            'hal',
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        endDrawer:  Drawer(),
        body: SingleChildScrollView(
          child: Column(children: [
            // container for the half part--------------------------------------------------------------------------------------
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
                    "𝐒𝐮𝐛𝐣𝐞𝐜𝐭𝐬",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
            ),
            //  grid view code----------------------------------------------------------------------------------------------
            Builder(
              builder: (context) {
                return Container(
                  height: 500,
                  child: GridView.builder(
                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                    itemCount: filteredsubject.length,
                    itemBuilder: (context, index) {
                      if (filteredsubject.isEmpty) {
                        return Center(child: Text("No subjects found"));
                      } else {
                        // Get the original index from the subject list
                        int originalIndex =
                            subject.indexOf(filteredsubject[index]);

                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              String selectedsub = filteredsubject[index];
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => NotelistViewScreen(
                                  selectedsub: selectedsub,
                                ),
                              ));
                            },
                            child: Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(catogry[originalIndex])),
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 147, 143, 143),
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            )
          ]),
        ),
      ),
    );
  }

  void filterSubjects(String query) {
    setState(() {
      filteredsubject = subject
          .where(
              (subject) => subject.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }
}
