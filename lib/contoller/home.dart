// import 'package:flutter/material.dart';

// class homeprovider extends ChangeNotifier{
//    late String username;
//   late String imagePaths;
 
//   homeprovider({ required String username,
//     required String imagePaths,});
//     {
//     username = username;
//     imagePaths = imagePaths;}
  
//   List<String> filteredsubject = [];
//   TextEditingController searchController = TextEditingController();

//   void filterSubjects(String query) {
//     filteredsubject = subject
//         .where(
//           (subject) => subject.toLowerCase().contains(query.toLowerCase()),
//         )
//         .toList();
//     notifyListeners();
//   }
// }