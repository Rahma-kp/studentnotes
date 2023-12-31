import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentnot/contoller/profile_provider.dart';
import 'package:studentnot/widget/bottombar.dart';

class ProfileEditingScreen extends StatefulWidget {
  const ProfileEditingScreen({Key? key});

  @override
  State<ProfileEditingScreen> createState() => _ProfileEditingScreenState();
}

class _ProfileEditingScreenState extends State<ProfileEditingScreen> {
  @override
  void initState() {
    super.initState();
    final profileProvider = Provider.of<ProfileEditingProvider>(context, listen: false);
    profileProvider.loadProfileData();
  }

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileEditingProvider>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const BottomBar(username: '', imagePaths: ''),
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
                      profileProvider.pickImage();
                    },
                    child: CircleAvatar(
                      backgroundImage: profileProvider.newImage != null
                          ? FileImage(profileProvider.newImage!)
                          : (profileProvider.img != null
                              ? FileImage(profileProvider.img!)
                              : const AssetImage("assets/images/person1.png")
                                  as ImageProvider<Object>),
                      radius: 40,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40, left: 40),
                    child: TextFormField(
                      controller: profileProvider.nameController,
                      decoration: const InputDecoration(
                        prefixText: "Name : ",
                        prefixStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: TextFormField(
                      controller: profileProvider.classController,
                      decoration: const InputDecoration(
                        prefixText: "Class : ",
                        prefixStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      profileProvider.saveProfileData(context);
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
}
