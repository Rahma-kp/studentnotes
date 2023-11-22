// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:splitwise_app/bottombar.dart';
// import 'package:splitwise_app/functions/contactlist_fn.dart';
// import 'package:splitwise_app/model/contactlist_model.dart';
// import 'package:splitwise_app/screens/addcontact_screen.dart';
// import 'package:splitwise_app/screens/edit_screen.dart';

// class Friendsscreen extends StatefulWidget {
//   ContactList contact;
//   Friendsscreen({Key? key, required this.contact}) : super(key: key);

//   @override
//   State<Friendsscreen> createState() => _FriendsscreenState();
// }

// class _FriendsscreenState extends State<Friendsscreen> {
 
//   List contactList = [];
//   String _search ='';
//   List<ContactList>filteredContactList =[];
//   List<ContactList> details=[];
 

//   @override
//   void initState(){
//     super.initState();
//     getAllcontacts();
//   }
//   void filteredContact() {
//     setState(() {
//       filteredContactList = contactListNotifier.value
//           .where((ContactList) =>
//               ContactList.name.toLowerCase().contains(_search.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
          
//           leading: IconButton(
//               onPressed: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                   builder: (context) => bottombar(),
//                 ));
//               },
//               icon: const Icon(
//                 Icons.arrow_back,
//                 color: Colors.black,
//               )),
//           backgroundColor: Color.fromARGB(255, 22, 140, 124),
//           elevation: 0,
//           title: const Text(
//             'Friends',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 26,
//               color: Colors.black,
//             ),
//           ),
//           actions: [
//             IconButton(
//                 onPressed: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => Addcontact(),
//                   ));
//                 },
//                 icon: Icon(Icons.person_add),color: Colors.black)
//           ],
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
//               child: TextFormField(
//                 decoration: InputDecoration(
//                   hintText: 'search contacts',
//                     fillColor: const Color.fromARGB(255, 237, 235, 235),
//                     filled: true,
//                     border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15)),
//                     prefixIcon: Icon(Icons.search),
                   
//                      ),
//                 onChanged: (value) {
//                   setState(() {
//                     _search = value;
//                     filteredContact(); 
//                   });
//                 },
//               ),
//             ),
//             Expanded(
//               child: Builder(builder: (context) {
//                 return ValueListenableBuilder(
//                     valueListenable: contactListNotifier,
//                     builder: (BuildContext ctx, List<ContactList> contactList,
//                         Widget? child) {
//                           final displaylist = filteredContactList.isNotEmpty? filteredContactList : contactList;
//                       return ListView.builder(
//                         itemBuilder: (ctx, index) {
//                           final data = displaylist[index];
//                           return ListTile(
//                             title: Text(data.name),
//                             subtitle: Text(data.number),
//                             trailing: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 IconButton(
//                                   onPressed: () {
//                                     Navigator.of(context)
//                                         .push(MaterialPageRoute(
//                                       builder: (context) => EditContacts(
//                                         name: data.name,
//                                         number: data.number,
//                                         index: index,
//                                       ),
//                                     ));
//                                   },
//                                   icon: Icon(Icons.edit, color: Colors.grey),
//                                 ),
//                                 IconButton(
//                                   onPressed: () {
//                                     deleteContacts(index);
//                                   },
//                                   icon: Icon(Icons.delete, color: Colors.grey),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                         itemCount: displaylist.length,
//                       );
//                     });
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

  
// }

//   Row contactlist({required String name, required String number}) {
//     return Row(
//       children: [
//         const SizedBox(width: 10),
//         const CircleAvatar(radius: 30, backgroundColor: Colors.grey),
//         const SizedBox(width: 30),
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Column(
//                 children: [
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: Align(
//                       alignment: Alignment.topRight,
//                       child: Text(
//                         name,
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 18),
//                       ),
//                     ),
//                   ),
//                   Text(
//                     'Number: $number',
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 width: 60,
//               ),
//               const Icon(
//                 Icons.edit,
//                 color: Color.fromARGB(255, 133, 130, 130),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               const Icon(
//                 Icons.delete,
//                 color: Color.fromARGB(255, 177, 32, 21),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
import 'dart:io';
import 'package:h/function/function.dart';
import 'package:h/model/model.dart';
import 'package:h/screens/add_student.dart';
import 'package:h/screens/edit.dart';
import 'package:h/screens/screen.dart';


import 'package:flutter/material.dart';

class ListStudentWidget extends StatefulWidget {
  const ListStudentWidget({super.key});

  @override
  State<ListStudentWidget> createState() => _ListStudentWidgetState();
}

class _ListStudentWidgetState extends State<ListStudentWidget> {
  // --------------------------------
  String _search = '';
  List<StudentModel> searchedlist = [];
  List<StudentModel> studentList = [];
  // ---------------------------------------------
  loadstudent() async {
    final allstudents = await getAllStudents();
    studentListNotifier.value = allstudents;
  }

  @override
  void initState() {
    super.initState();
  getAllStudents();
  
    loadstudent();
  }

  void searchResult() {
    setState(() {
      searchedlist = studentListNotifier.value
          .where((StudentModel) =>
              StudentModel.name.toLowerCase().contains(_search.toLowerCase()))
          .toList();
    });
  }

  // --------------------------------------

  @override
  Widget build(BuildContext context) {
    
    
    return SafeArea  (
      child: Scaffold(
        appBar: AppBar(
           flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                  Color.fromARGB(255, 0, 11, 46),
                   Colors.red ,
                  ]
                  )
              ),
            ),
          title: Center(
            child: Text('𝕾 𝖙 𝖚 𝖉 𝖊 𝖓 𝖙 𝕷 𝖎 𝖘 𝖙'),
          ),
          backgroundColor: Colors.red,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(0))),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddStudentWidget()));
                },
                icon: Icon(Icons.group_add_rounded,color: Colors.black,))
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/istockphoto-1257005098-170667a.webp'),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(75),
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(
                        color: Colors.lightBlue,
                        width: 2,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    // ----------------------
                    setState(() {
                      _search = value;
                    });
                    searchResult();
    
                    // ---------------------
                  },
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: studentListNotifier,
                  builder: (BuildContext ctx, List<StudentModel> studentList,
                      Widget? child) {
                    final displayedStudents =
                        searchedlist.isNotEmpty ? searchedlist : studentList;
                    return ListView.separated(
                      itemBuilder: (ctx, index) {
                        final data = displayedStudents[index];
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                          child: Card(
                            color: Colors.transparent,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: ListTile(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ViewStudentScreen(
                                      name: data.name,
                                      age: data.age,
                                      phone: data.edu,
                                      place: data.address,
                                      imagePath: data.image ?? "",
                                    ),
                                  ),
                                );
                              },
                              textColor: Colors.white,
                              title: Text(data.name),
                              subtitle: Text(data.age),
                              leading: CircleAvatar(
                                  backgroundImage: data.image != null
                                      ? FileImage(File(data.image!))
                                      : AssetImage("assets/gk.jpeg")
                                          as ImageProvider),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => EditStudent(
                                              index: index,
                                              name: data.name,
                                              age: data.age,
                                              edu: data.edu,
                                              address: data.address,
                                              imagePath: data.image),
                                        ));
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      )),
                                  IconButton(
                                      onPressed: () {
                                        deleteStudent(index);
                                      },
                                      icon: const Icon(Icons.delete,
                                          color:
                                              Color.fromARGB(255, 255, 17, 0))),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (ctx, index) {
                        return const Divider();
                      },
                      itemCount: displayedStudents.length,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}