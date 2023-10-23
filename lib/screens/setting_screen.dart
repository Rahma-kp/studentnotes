import 'package:flutter/material.dart';
import 'package:studentnot/drawer.dart';

class setting_screen extends StatelessWidget {
  const setting_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor:const Color.fromARGB(207, 13, 20, 78),elevation:0,
        title:const Text("Settings"),
        ),endDrawer: drawer(),
        body: Column(
          children: [
            ListTile( leading:const Icon(Icons.info_outline),
              title:const Text("About"), trailing:const Text(">",style: TextStyle(fontSize: 30),),onTap: () {
                
              },),
              const Divider(),
               ListTile( leading:const Icon(Icons.document_scanner),
              title:const Text("Term & conditions"), trailing:const Text(">",style: TextStyle(fontSize: 30),),onTap: () {
                
              },),
              const Divider(), 
              ListTile( leading:const Icon(Icons.restore_outlined),
              title:const Text("Reset App"), trailing:const Text(">",style: TextStyle(fontSize: 30),),onTap: () {
                
              },),
              const Divider(),
               ListTile( leading:const Icon(Icons.logout_outlined),
              title:const Text("Logout"), trailing:const Text(">",style: TextStyle(fontSize: 30),),onTap: () {
                
              },),
              const Divider(),
    
          ],
        ),
      ),
    );
  }
}