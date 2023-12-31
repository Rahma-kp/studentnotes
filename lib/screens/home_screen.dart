import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentnot/contoller/home_screen.dart';
import 'package:studentnot/screens/NoteScreens/notes_listview.dart';
import 'package:studentnot/screens/profile_editing_screen.dart';

class HomeScreen extends StatefulWidget {
  final String username;
  final String imagePaths;

  const HomeScreen(
      {super.key, required this.username, required this.imagePaths});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    var provide = Provider.of<HomeScreenProvider>(context, listen: false);
    provide.filteredsubject = provide.subject;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(221, 202, 194, 194),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            Padding(
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
                      backgroundImage: widget.imagePaths.isNotEmpty
                          ? FileImage(File(widget.imagePaths))
                          : const AssetImage('assets/images/person1.png')
                              as ImageProvider<Object>?)),
            ),
          ],
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
                        child: Consumer<HomeScreenProvider>(
                          builder: (context, values, child) => TextFormField(
                            controller: values.searchController,
                            onChanged: (value) {
                              values.filterSubjects(value);
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
              Consumer<HomeScreenProvider>(
                builder: (context, val, child) => Builder(
                  builder: (context) {
                    return SizedBox(
                      height: 500,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: val.filteredsubject.length,
                        itemBuilder: (context, index) {
                          if (val.filteredsubject.isEmpty) {
                            return const Center(
                              child: Text(
                                "No subjects found",
                                style: TextStyle(color: Colors.amber),
                              ),
                            );
                          } else {
                            int originalIndex =
                                val.subject.indexOf(val.filteredsubject[index]);
                            return Padding(
                              padding: const EdgeInsets.all(10),
                              child: GestureDetector(
                                onTap: () {
                                  String selectedsub =
                                      val.filteredsubject[index];
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => NotelistViewScreen(
                                        imagelistss: [],
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
                                        val.catogry[originalIndex],
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color: const Color.fromARGB(
                                        255, 147, 143, 143),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
