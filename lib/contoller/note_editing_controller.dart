import 'package:flutter/material.dart';

class NotEditingProvider extends ChangeNotifier {
  TextEditingController notetitilecontroller = TextEditingController();
  TextEditingController chaptercontroller = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  List<String> imagelist = [];
  String selectedsub = 'SUBJECTS';
  List<String> sujectList = [
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
    'Environmental ',
    'Geography',
    'Health Sciences',
    'Entrepreneurship',
    'Arts',
  ];
  NotEditingProvider({
    required String notetitle,
    required String note,
    required String category,
    required List<String> imagelists,
  }) {
    notetitilecontroller.text = notetitle;
    chaptercontroller.text = note;
    categoryController.text = category;
    imagelist = List.from(imagelists);
  }

  void pickImage(String imagePath) {
    imagelist.add(imagePath);
    notifyListeners();
  }

  void removeImage(int index) {
    imagelist.removeAt(index);
    notifyListeners();
  }

  void updateSubject(String value) {
    selectedsub = value;
    categoryController.text = value;
    notifyListeners();
  }
}
