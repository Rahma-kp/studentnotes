import 'dart:io';
import 'package:flutter/material.dart';
import 'package:studentnot/screens/notesscreens/notes_listview.dart';
import 'package:studentnot/screens/profile_editing_screen.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  final String imagePath;

  const HomeScreen({super.key, required this.username, required this.imagePath});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> subject = [
    'Language',
    'English',
    'Physics',
    'Mathematics',
    'Chemistry',
    'Social Science',
    'Biology',
    'Zoology',
    'Botany',
    'Computer',
    'Environmental',
    'Geography',
    'Health Sciences',
    'Entrepreneurship',
    'Arts',
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
    'assets/catogory/cmp.jpg',
    'assets/catogory/env.jpg',
    'assets/catogory/geyo.jpg',
    'assets/catogory/health.jpg',
    'assets/catogory/entreprenceur.jpeg',
    'assetscatogory/art.jpeg',
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
        backgroundColor: const Color.fromARGB(221, 202, 194, 194),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ProfileEditingScreen(),
                    ),
                  );
                },
                child: CircleAvatar(
                    backgroundImage: widget.imagePath.isNotEmpty
                        ? FileImage(File(widget.imagePath))
                        : const AssetImage('assets/images/person1.png')
                            as ImageProvider<Object>?)),
          ),
          title: Text(
            widget.username,
            style: const TextStyle(color: Colors.white),
          ),
          elevation: 0,
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(207, 13, 20, 78),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
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
                              borderRadius: BorderRadius.circular(20),
                            ),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.black54,
                            ),
                            hintText: "Search....",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "𝐒𝐔𝐁𝐉𝐄𝐂𝐓𝐒",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  return SizedBox(
                    height: 500,
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: filteredsubject.length,
                      itemBuilder: (context, index) {
                        if (filteredsubject.isEmpty) {
                          return const Center(
                            child: Text(
                              "No subjects found",
                              style: TextStyle(color: Colors.amber),
                            ),
                          );
                        } else {
                          int originalIndex =
                              subject.indexOf(filteredsubject[index]);
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {
                                String selectedsub = filteredsubject[index];
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => NotelistViewScreen(
                                      imagelistss: [],
                                      documentlistss: [],
                                      selectedsub: selectedsub,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      catogry[originalIndex],
                                    ),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                  color:
                                      const Color.fromARGB(255, 147, 143, 143),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  void filterSubjects(String query) {
    setState(() {
      filteredsubject = subject
          .where(
            (subject) => subject.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }
}
