// import 'package:flutter/material.dart';
// import 'package:studentnot/screens/profile_editing_screen.dart';

// class CustomDrawer extends StatelessWidget {
//   const CustomDrawer({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: const Color.fromARGB(255, 106, 86, 86),
//       elevation: 10,
//       child: Column(
//         children: [
//           const SizedBox(height: 30),
//           const CircleAvatar(
//             radius: 70,
//             backgroundImage: AssetImage("assets/images/person.jpeg"),
//           ),
//           const ListTile(
//             leading: Text("Name:", style: TextStyle(fontSize: 20)),
//             title: Text("Adil", style: TextStyle(fontSize: 20)),
//           ),
//           const ListTile(
//             leading: Text("Class:", style: TextStyle(fontSize: 20)),
//             title: Text("10th", style: TextStyle(fontSize: 20)),
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => const ProfileEditingScreen(),
//                 ),
//               );
//             },
//             backgroundColor: const Color.fromARGB(207, 13, 20, 78),
//             child: const Icon(Icons.edit, color: Colors.white),
//           ),
//         ],
//       ),
//     );
//   }
// }
