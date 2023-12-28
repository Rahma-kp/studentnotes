import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentnot/widget/bottombar.dart';
import 'package:studentnot/screens/login_screen.dart';
const String save_Key_Name = 'user_logged_in';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    @override
  void initState() {
    checkuserloggedin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/img4-removebg-preview.png",),
          Container(height:30,width:200,
            color:const Color.fromARGB(207, 13, 20, 78), child: const Center(child: Text('𝐒𝐭𝐮𝐝𝐲 𝐨𝐧 𝐦𝐲 𝐰𝐚𝐲',style: TextStyle(fontSize: 20,color: Colors.white),)))
        ],
      )),
    );
  }
    Future<void> gotologinpage() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  Future<void> checkuserloggedin() async {
    final sharedprefs = await SharedPreferences.getInstance();
    final userLoggedIn = sharedprefs.getBool(save_Key_Name);

    if (userLoggedIn == null || userLoggedIn == false) {
      gotologinpage();
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (ctx1) => const BottomBar(username: '',imagePaths: '',)),
      );
    }
  }
}