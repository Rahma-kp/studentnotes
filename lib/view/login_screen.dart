import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studentnot/contoller/login_page_conroller.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    Provider.of<LoginProvider>(context, listen: false).checkIfAlreadyLoggedIn(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: SafeArea(
        child: Scaffold(
          body: Consumer<LoginProvider>(
            builder: (context, loginProvider, child) {
              return SingleChildScrollView(
                child: Form(
                  key: loginProvider.formKey,
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
                        onTap: () => loginProvider.getimage(ImageSource.gallery),
                        child: CircleAvatar(
                          backgroundColor: const Color.fromARGB(255, 223, 176, 176),
                          radius: 60,
                          child: loginProvider.picked == null
                              ? const Icon(Icons.add_a_photo)
                              : ClipOval(
                                  child: Image.file(
                                    loginProvider.picked!,
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
                          controller: loginProvider.usernameController,
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
                          controller: loginProvider.classController,
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
                          if (loginProvider.formKey.currentState?.validate() ?? false) {
                            loginProvider.checkLogin(context);
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
              );
            },
          ),
        ),
      ),
    );
  }
}
