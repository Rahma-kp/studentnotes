import 'package:flutter/material.dart';
import 'package:studentnot/drawer.dart';
import 'package:studentnot/screens/about_page.dart';
import 'package:studentnot/screens/login_screen.dart';
import 'package:studentnot/screens/terms_screen.dart';

class settingScreen extends StatelessWidget {
  const settingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor:const Color.fromARGB(207, 13, 20, 78),elevation:0,
        title:const Text("Settings",style: TextStyle(color: Colors.white),),
        ),endDrawer: drawer(),
        body: Column(
          children: [
            ListTile( leading:const Icon(Icons.info_outline),
              title:const Text("About"), trailing:const Text(">",style: TextStyle(fontSize: 30),),onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => aboutPageScreen(),));
              },),
              const Divider(),
               ListTile( leading:const Icon(Icons.document_scanner),
              title:const Text("Term & conditions"), trailing:const Text(">",style: TextStyle(fontSize: 30),),onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => terms(),));
              },),
              const Divider(), 
              ListTile( leading:const Icon(Icons.restore_outlined),
              title:const Text("Reset App"), trailing:const Text(">",style: TextStyle(fontSize: 30),),onTap: () {
                
              },),
              const Divider(),
               ListTile( leading:const Icon(Icons.logout_outlined),
              title:const Text("Logout"), trailing:const Text(">",style: TextStyle(fontSize: 30),),onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => loginScreen(),));
              },),
              const Divider(),
    
          ],
        ),
      ),
    );
  }
}