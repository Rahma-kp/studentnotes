import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier {
     List<String> subjects = [
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
  
  List<String> catogry = [
    'assets/catogory/lang.jpg',
    'assets/catogory/eng.jpg',
    'assets/catogory/phy.jpg',
    'assets/catogory/math.jpg',
    'assets/catogory/ch.jpg',
    'assets/catogory/so.jpg',
    'assets/catogory/bio.jpg',
    'assets/catogory/zoo.jpg',
    'assets/catogory/botany.jpg',
    'assets/catogory/cmp.jpg',
    'assets/catogory/env.jpg',
    'assets/catogory/geyo.jpg',
    'assets/catogory/health.jpg',
    'assets/catogory/entreprenceur.jpeg',
    'assets/catogory/art.jpeg',
  ];
  late String _username;
  late String _imagePaths;
  late List<String> _subject;
  late List<String> _category;
  late List<String> _filteredSubject;
  TextEditingController _searchController = TextEditingController();

  HomeScreenProvider({
    required String username,
    required String imagePaths,
    required List<String> subject,
    required List<String> category,
  }) {
    _username = username;
    _imagePaths = imagePaths;
    _subject = subject;
    _category = category;
    _filteredSubject = subject;
  }

  String get username => _username;
  String get imagePaths => _imagePaths;
  List<String> get subject => _subject;
  List<String> get category => _category;
  List<String> get filteredSubject => _filteredSubject;
  TextEditingController get searchController => _searchController;

  void filterSubjects(String query) {
    _filteredSubject = _subject
        .where(
          (subject) => subject.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    notifyListeners();
  }
}
