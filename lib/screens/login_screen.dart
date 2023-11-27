import 'package:flutter/material.dart';
import 'package:studentnot/bottombar.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 500,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color.fromARGB(207, 13, 20, 78),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(60))),
                        child: Image.asset("assets/images/img1-removebg-preview.png",),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 70,right: 70,top:30),
                child: TextFormField(decoration: InputDecoration(hintText: "Username...."),),
              ),
              SizedBox(height: 40,),
            GestureDetector(onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) =>BottomBar(),));
            },
              child: Container(height: 40,width:100,
                decoration: BoxDecoration(color:Color.fromARGB(207, 13, 20, 78),borderRadius: BorderRadius.circular(20)
                ),child: Center(child: Text("Let's Go...",style: TextStyle(color: Colors.white),)),),
            )
            ],
          ),
        ),
      ),
    );
  }
}
