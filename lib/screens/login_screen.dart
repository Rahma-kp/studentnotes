import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentnot/widget/bottombar.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController classController = TextEditingController();
  late ImagePicker imagePicker = ImagePicker();
  File? picked;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    checkIfAlreadyLoggedIn();
  }

  void checkIfAlreadyLoggedIn() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final isLoggedIn = sharedPrefs.getBool('save_Key_Name') ?? false;

    if (isLoggedIn) {
      // User is already logged in, navigate to home screen
      final username = sharedPrefs.getString('username') ?? '';
      final imagePath = sharedPrefs.getString('imagePath') ?? '';

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BottomBar(username: username, imagePaths: imagePath),
        ),
      );
    }
  }

  void getimage(ImageSource source) async {
    var img = await imagePicker.pickImage(source: source);
    setState(() {
      picked = File(img!.path);
    });
  }

  void checkLogin(BuildContext ctx) async {
    final username = usernameController.text;
    final password = classController.text;

    if (username.isNotEmpty && password.isNotEmpty || picked != null) {
      final sharedprefs = await SharedPreferences.getInstance();
      await sharedprefs.setBool('save_Key_Name', true);
      await sharedprefs.setString('username', username);
      await sharedprefs.setString('class', password);
      await sharedprefs.setString('imagePath', picked?.path ?? '');

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BottomBar(
            username: username,
            imagePaths: picked?.path ?? '',
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context1) {
          return AlertDialog(
            title: const Text(
              'Ooops',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            content: const Text(
              'Enter Valid Username, Password, and Capture an Image!',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context1).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }

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
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(60)),
                  ),
                  child: Image.asset(
                    "assets/images/img1-removebg-preview.png",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => getimage(ImageSource.gallery),
                  child: CircleAvatar(
                    backgroundColor: const Color.fromARGB(255, 223, 176, 176),
                    radius: 60,
                    child: picked == null
                        ? const Icon(Icons.add_a_photo)
                        : ClipOval(
                            child: Image.file(
                              picked!,
                              fit: BoxFit.cover,
                              height: 120,
                              width: 120,
                            ),
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70, top: 30),
                  child: TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(hintText: "Username...."),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a username';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 70, right: 70, top: 30),
                  child: TextFormField(
                    controller: classController,
                    decoration: const InputDecoration(hintText: "Class...."),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a class';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      checkLogin(context);
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(207, 13, 20, 78),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
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
}
