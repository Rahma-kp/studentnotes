// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:open_file/open_file.dart';

// class documnetss extends StatefulWidget {
//   const documnetss({super.key});

//   @override
//   State<documnetss> createState() => _documnetssState();
// }

// class _documnetssState extends State<documnetss> {
//   late List<PlatformFile>? _documentlists = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: (){_pickFiless();},child: Icon(Icons.add),),
//       body: Column(children: [
//         Align(
//             alignment: Alignment.topLeft,
//             child: Text(
//               "𝐃𝐎𝐂𝐔𝐌𝐄𝐍𝐓𝐒",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             )),
//         Padding(
//           padding: const EdgeInsets.all(20),
//           child: Container(
//             height: 400,
//             width: 900,
//             decoration: BoxDecoration(
//                 border: Border.all(style: BorderStyle.solid),
//                 borderRadius: BorderRadius.circular(10)),
//             child: ListView.builder(
//               itemCount: _documentlists!.length,
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: const EdgeInsets.all(10),
//                   child: GestureDetector(
//                     onTap: () {
//                       openFile(_documentlists![index]);
//                     },
//                     child: Card(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(20)),
//                       child: ListTile(
//                         tileColor: const Color.fromARGB(221, 130, 136, 147),
//                         title: Text(_documentlists![index].name),
//                         subtitle: Text('${_documentlists![index].path}'),
//                         trailing: IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 _documentlists!.removeAt(index);
//                               });
//                             },
//                             icon: const Icon(Icons.close)),
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//         )
//       ]),
//     );
//   }

//   void _pickFiless() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.custom,
//       allowedExtensions: ['pdf', 'doc', 'docx', 'txt'],
//       allowMultiple: true,
//     );
//     if (result != null && result.files.isNotEmpty) {
//       setState(() {
//         _documentlists = result.files;
//       });
//     }
//   }

//   Future<void> openFile(PlatformFile file) async {
//     final filePath = file.path;
//     try {
//       await OpenFile.open(filePath);
//     } catch (error) {
//       print(error);
//     }
//   }
// }
