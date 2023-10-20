import 'package:flutter/material.dart';

class home_screen extends StatelessWidget {
  const home_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Color.fromARGB(207, 13, 20, 78),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 25,
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert_outlined,
                      color: Colors.white,
                    ))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(width:400,
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white60,
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                    hintText: "Search...."),
              ),
            ),
            SizedBox(height: 10,),
            Column(
              children: [
                Text("Hai,",style: TextStyle(color: Colors.white,fontSize: 30),),
                Text("rahma",style: TextStyle(color: Colors.white,fontSize: 30),)
              ],
            )
          ]),
        ),
        SizedBox(height: 10,),
        Align(alignment: Alignment.topLeft,
          child: Text("Subjects",style: TextStyle(fontSize: 25),))
      ]),
    );
  }
}
