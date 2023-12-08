import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentnot/widget/bottombar.dart';

class ProfileEditingScreen extends StatefulWidget {
  const ProfileEditingScreen({super.key});

  @override
  State<ProfileEditingScreen> createState() => _ProfileEditingScreenState();
}

class _ProfileEditingScreenState extends State<ProfileEditingScreen> {
  late TextEditingController nameController;
  late TextEditingController classController;
  File? _img;


  @override
  Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
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
                CircleAvatar(
                  backgroundImage: _img != null
                      ? FileImage(_img!)
                      : const AssetImage("assets/images/person.jpeg")
                          as ImageProvider<Object>,
                  radius: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, left: 40),
                  child: TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                        prefixText: "Name : ",
                        prefixStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: TextFormField(
                    controller: classController,
                    decoration: const InputDecoration(
                        prefixText: "Class : ",
                        prefixStyle: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const BottomBar(username: '',)),
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
        child: const Icon(Icons.add_a_photo),
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
