import 'package:flutter/material.dart';
import 'package:studentnot/bottombar.dart';


class profile_editing_screen extends StatelessWidget {
  const profile_editing_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(207, 13, 20, 78),
        title: Text("Profile"),
      ),
      body: Center(
        child: Card(
          color: Colors.black26,
          child: Container(
            height: 350,
            width: 350,
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/person.jpeg"),
                  radius: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40, left: 40),
                  child: TextField(decoration: InputDecoration(prefixText:"Name : " ,prefixStyle: TextStyle(color: Colors.black)),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40),
                  child: TextField(decoration:InputDecoration(prefixText: "Class : ",prefixStyle: TextStyle(color: Colors.black)) ,),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) =>bottombar(),)),
                  child: Container(height:35,width:65,decoration:BoxDecoration(color:Color.fromARGB(207, 13, 20, 78),borderRadius: BorderRadius.circular(10)),child: Align(
                    alignment: Alignment.center,
                    child: Text("Save",style: TextStyle(color: Colors.white,fontSize:20),)),),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
