import 'package:flutter/material.dart';

class setting_screen extends StatelessWidget {
  const setting_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(backgroundColor:Color.fromARGB(207, 13, 20, 78),elevation:0,
        title:Text("Settings"),
        actions: [IconButton(onPressed: (){}, icon:Icon(Icons.menu))],),
        body: Column(
          children: [
            ListTile( leading:Icon(Icons.info_outline),
              title:Text("About"), trailing:Text(">",style: TextStyle(fontSize: 30),),onTap: () {
                
              },),
              Divider(),
               ListTile( leading:Icon(Icons.document_scanner),
              title:Text("Term & conditions"), trailing:Text(">",style: TextStyle(fontSize: 30),),onTap: () {
                
              },),
              Divider(), 
              ListTile( leading:Icon(Icons.restore_outlined),
              title:Text("Reset App"), trailing:Text(">",style: TextStyle(fontSize: 30),),onTap: () {
                
              },),
              Divider(),
               ListTile( leading:Icon(Icons.logout_outlined),
              title:Text("Logout"), trailing:Text(">",style: TextStyle(fontSize: 30),),onTap: () {
                
              },),
              Divider(),
    
          ],
        ),
      ),
    );
  }
}