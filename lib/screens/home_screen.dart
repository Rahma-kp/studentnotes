import 'package:flutter/material.dart';
import 'package:studentnot/db/db_functions/db_functions.dart';
import 'package:studentnot/db/db_model/data_model.dart';
import 'package:studentnot/drawer.dart';

class home_screen extends StatelessWidget {
   
   subdata sub1;
   
   home_screen({Key? key,required this.sub1}):super(key: key);
   

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/person.jpeg")),
          ),
          title: Text("Adil"),
          elevation: 0,
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        ),
        endDrawer: const drawer(),
        body: SingleChildScrollView(
          child: Column(children: [

            // containe the half part--------------------------------------------------------------------------------------
            Container(
              height: 200,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(207, 13, 20, 78),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Column(children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white60,
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.black54,
                          ),
                          hintText: "Search...."),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
            ),
            //-------------------------------------------------------------------
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Subjects",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
            ),
          
//  grid view code----------------------------------------------------------------------------------------------
            Builder(
              builder: (context) {
                return ValueListenableBuilder<List<subdata>>(
            valueListenable: SubListNotifier, 
            builder: (BuildContext ctx, List<subdata> subList, Widget? child) {
              return Container(
                height: 500,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemCount: subList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 147, 143, 143),
                  ),
                  child: Column(
                    children: [
                      Title(color: Colors.black, child: Text(sub1.subtitle,
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                      Text(sub1.subabout),
                    ],
                  ),
                          ), 
                    );
                  },
                ),
              );
            },
            );
              }
            )
          
          //  ---------------------------------------------------------------------------------------------------------------------------------
          ]),
        ),
      ),
    );
  }  
}
