import 'package:flutter/material.dart';
import 'package:studentnot/screens/note_screen.dart';

class listview_screen extends StatelessWidget {
  const listview_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(207, 13, 20, 78),
      ),
      body: ListView(children: [
        ListTile(
          leading: Image.asset(
            "assets/images/m1.jpeg",
            height: 50,
            width: 50,
          ),
          title: Text(
            "Chapter:1",
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          subtitle: Text("Ttigonometry,the branch of mathematics concernd  whith specific functions of angle and their application to calculate"),
          trailing: SingleChildScrollView(
            reverse: true,
            child: Column(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: (){}, icon:Icon(Icons.edit)),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete))
              ],
            ),
          ),
          onTap: () {Navigator.of(context).push(MaterialPageRoute(builder: (context) => note_screen(),));},
        ),
        Divider(),
         ListTile(
          leading: Image.asset(
            "assets/images/m1.jpeg",
            height: 50,
            width: 50,
          ),
          title: Text(
            "Chapter:2",
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          subtitle: Text("Algebra is the study of variables and the rule for manipulating these variable information"),
          trailing: SingleChildScrollView(
            reverse: true,
            child: Column(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed: (){}, icon:Icon(Icons.edit)),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete))
              ],
            ),
          ),
          onTap: () {},
        ),
       Divider()
      ]),
    );
  }
}
