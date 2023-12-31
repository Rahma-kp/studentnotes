
import 'dart:io';

import 'package:flutter/material.dart';

class HomeScreenProvider extends ChangeNotifier{
   final searchController=TextEditingController();
   late List<String> filteredsubject=[];
   List<String> subject = [
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
 File? img; 
  File? newImage;

     void filterSubjects(String query) {
    filteredsubject = subject
        .where(
          (subject) => subject.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    notifyListeners();
  }
}
