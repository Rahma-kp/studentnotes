import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentnot/widget/bottombar.dart';

class ProfileEditingScreen extends StatefulWidget {
  const ProfileEditingScreen({Key? key});

  @override
  State<ProfileEditingScreen> createState() => _ProfileEditingScreenState();
}

class _ProfileEditingScreenState extends State<ProfileEditingScreen> {
  late final TextEditingController nameController;
  late final TextEditingController classController;
  File? _img;
  File? _newImage; // Store the newly picked image temporarily.

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    classController = TextEditingController();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedName = prefs.getString("username");
    String? savedClass = prefs.getString("class");
    String? savedImagePath = prefs.getString("imagePath");

    if (savedName != null) {
      nameController.text = savedName;
    }

    if (savedClass != null) {
      classController.text = savedClass;
    }

    if (savedImagePath != null) {
      setState(() {
        _img = File(savedImagePath);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const BottomBar(username: '',imagePaths: ''),
                ),
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          title: const Text("Profile", style: TextStyle(color: Colors.white)),
        ),
        body: Center(
          child: Card(
            color: Colors.black26,
            child: SizedBox(
              height: 350,
              width: 350,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      _pickImage();
                    },
                    child: CircleAvatar(
                      backgroundImage: _newImage != null
                          ? FileImage(_newImage!)
                          : (_img != null
                              ? FileImage(_img!)
                              : const AssetImage("assets/images/person1.png")
                                  as ImageProvider<Object>),
                      radius: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40, left: 40),
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        prefixText: "Name : ",
                        prefixStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      controller: classController,
                      decoration: const InputDecoration(
                        prefixText: "Class : ",
                        prefixStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setString("username", nameController.text);
                      prefs.setString("class", classController.text);
                      if (_newImage != null) {
                        prefs.setString("imagePath", _newImage!.path);
                        setState(() {
                          _img = _newImage;
                          _newImage = null; 
                        });
                      }
                      String updatedUsername =
                          prefs.getString("username") ?? '';
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) =>
                              BottomBar(username: updatedUsername,imagePaths:''),
                        ),
                      );
                    },
                    child: Container(
                      height: 35,
                      width: 65,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(207, 13, 20, 78),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Save",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _newImage = File(pickedFile.path);
      }
    });
  }
}