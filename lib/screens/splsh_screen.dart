import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentnot/bottombar.dart';
import 'package:studentnot/screens/login_screen.dart';
const String SAVE_KEY_NAME = 'user_logged_in';


class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

    @override
  void initState() {
    CheckUserLoggedIn();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset("assets/images/img4-removebg-preview.png",)),
    );
  }
    Future<void> gotoLoginpage() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => loginScreen()),
    );
  }

  Future<void> CheckUserLoggedIn() async {
    final sharedprefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedprefs.getBool(SAVE_KEY_NAME);

    if (userLoggedIn == null || userLoggedIn == false) {
      gotoLoginpage();
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx1) => BottomBar(username: '',)),
      );
    }
  }
}