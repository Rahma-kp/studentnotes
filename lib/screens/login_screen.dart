import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentnot/bottombar.dart';
import 'package:studentnot/main.dart';

class loginScreen extends StatefulWidget {
  loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final ImagePicker imagePicker = ImagePicker();
  File? picked;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(207, 13, 20, 78),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(60)),
                  ),
                  child: Image.asset(
                    "assets/images/img1-removebg-preview.png",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => getimage(ImageSource.camera),
                  child: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 223, 176, 176),
                    child: picked == null
                        ? Icon(Icons.add_a_photo)
                        : ClipOval(
                            child: Image.file(
                              picked!,
                              fit: BoxFit.cover,
                              height: 120,
                              width: 120,
                            ),
                          ),
                    radius: 60,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70, top: 30),
                  child: TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(hintText: "Username...."),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70, top: 30),
                  child: TextFormField(
                    controller: classController,
                    decoration: InputDecoration(hintText: "Class...."),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                GestureDetector(
                 onTap: () {
                if(_formKey.currentState?.validate()??false){
                  checkLogin(context);
                }
              },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(207, 13, 20, 78),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        "Let's Go...",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  getimage(ImageSource source) async {
    var img = await imagePicker.pickImage(source: source);
    setState(() {
      picked = File(img!.path);
    });
  }

   void checkLogin(BuildContext ctx) async {
    final _username = usernameController.text;
    final _password = classController.text;

    if (_username == _password) {
      print('Ready\nLoggedIn');

      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(SAVE_KEY_NAME, true);

      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(builder: (ctx1) => BottomBar(username: '',)),
      );
    } else {
      print("Username or password not match");
      showDialog(
        context: context,
        builder: (context1) {
          return AlertDialog(
            title: Text(
              'Ooops',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            content: Text('Enter Valid Password!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context1).pop();
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }
}
