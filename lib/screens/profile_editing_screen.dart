import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentnot/bottombar.dart';

class ProfileEditingScreen extends StatefulWidget {
  const ProfileEditingScreen({Key? key});

  @override
  State<ProfileEditingScreen> createState() => _ProfileEditingScreenState();
}

class _ProfileEditingScreenState extends State<ProfileEditingScreen> {
  late TextEditingController nameController;
  late TextEditingController classController;
  File? _img;

  @override
  void initState() {
    nameController = TextEditingController();
    classController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(207, 13, 20, 78),
        title: Text("Profile", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Card(
          color: Colors.black26,
          child: Container(
            height: 350,
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: _img != null
                      ? FileImage(_img!)
                      : AssetImage("assets/images/person.jpeg")
                          as ImageProvider<Object>,
                  radius: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, left: 40),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        prefixText: "Name : ",
                        prefixStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextFormField(
                    controller: classController,
                    decoration: InputDecoration(
                        prefixText: "Class : ",
                        prefixStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    String name = nameController.text;
                    String className = classController.text;

                    // Save user information to SharedPreferences
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    prefs.setString('name', name);
                    prefs.setString('className', className);

                    if (_img != null) {
                      // Save the image path or upload the image to a server and save the URL
                      // For simplicity, saving the local path here
                      prefs.setString('imagePath', _img!.path);
                    }

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => bottombar()));
                  },
                  child: Container(
                    height: 35,
                    width: 65,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(207, 13, 20, 78),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Save",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _img = File(pickedFile.path);
      }
    });
  }
}
