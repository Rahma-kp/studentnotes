import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentnot/contoller/profile_provider.dart';
import 'package:studentnot/widget/bottombar.dart';

class ProfileEditingScreen extends StatelessWidget {
  const ProfileEditingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: _ProfileEditingScreen(),
    );
  }
}

class _ProfileEditingScreen extends StatefulWidget {
  @override
  State<_ProfileEditingScreen> createState() => _ProfileEditingScreenState();
}

class _ProfileEditingScreenState extends State<_ProfileEditingScreen> {
  late final TextEditingController nameController;
  late final TextEditingController classController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    classController = TextEditingController();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
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
      profileProvider.setProfileImage(File(savedImagePath));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // ... (Your existing code)
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
                      _pickImage(context);
                    },
                    child: CircleAvatar(
                      backgroundImage: Provider.of<ProfileProvider>(context).newImage != null
                          ? FileImage(Provider.of<ProfileProvider>(context).newImage!)
                          : Provider.of<ProfileProvider>(context).profileImage != null
                              ? FileImage(Provider.of<ProfileProvider>(context).profileImage!)
                              : const AssetImage("assets/images/person1.png") as ImageProvider<Object>,
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
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      prefs.setString("username", nameController.text);
                      prefs.setString("class", classController.text);

                      final profileProvider = Provider.of<ProfileProvider>(context, listen: false);

                      if (profileProvider.newImage != null) {
                        prefs.setString("imagePath", profileProvider.newImage!.path);
                        profileProvider.setProfileImage(profileProvider.newImage!);
                        profileProvider.clearNewImage();
                      }

                      String updatedUsername = prefs.getString("username") ?? '';
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => BottomBar(username: updatedUsername, imagePaths: ''),
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

  Future<void> _pickImage(BuildContext context) async {
    final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileProvider.setNewImage(File(pickedFile.path));
    }
  }
}
