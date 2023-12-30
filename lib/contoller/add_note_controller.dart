import 'package:flutter/material.dart';

class AddNoteProvider extends ChangeNotifier{
 final notetitilecontroller = TextEditingController();
  final chaptercontroller = TextEditingController();
  final categoryController = TextEditingController();
  final List<String> imagelist = []; 
  String selectedsub = 'SUBJECTS';
  final List<String> sujectList = [
    'SUBJECTS',
    'Language',
    'English',
    'Physics',
    'Mathematics',
    'Chemistry',
    'Social Science',
    'Biology',
    'Zoology',
    'Botany',
    'Computer',
    'Environmental',
    'Geography',
    'Health Sciences',
    'Entrepreneurship',
    'Arts',
  ];
List<String> get imagelists=>imagelist;
  void addimage(String imagepath){
    imagelist.add(imagepath);
    notifyListeners();
  }

  void removeimage(int index){
    imagelist.removeAt(index);
    notifyListeners();
  }


 void updateSelectedSubject(String value) {
    selectedsub=value;
    chaptercontroller.text=value;
    notifyListeners();
  }

}