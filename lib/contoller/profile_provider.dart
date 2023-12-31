import 'dart:io';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentnot/widget/bottombar.dart';

class ProfileEditingProvider extends ChangeNotifier {
  TextEditingController nameController = TextEditingController();
  TextEditingController classController = TextEditingController();
  File? img;
  File? newImage;
  Future<void> loadProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedName = prefs.getString("username");
    String? savedClass = prefs.getString("class");
    String? savedImagePath = prefs.getString("imagePath");

    if (savedName != null) {
      nameController.text = savedName;
    }

    if (savedClass != null) {
      classController.text = savedClass;
    }

    if (savedImagePath != null) {
      img = File(savedImagePath);
    }

    notifyListeners();
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      newImage = File(pickedFile.path);
      notifyListeners();
    }
  }


  Future<void> saveProfileData(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("username", nameController.text);
    prefs.setString("class", classController.text);

    if (newImage != null) {
      prefs.setString("imagePath", newImage!.path);
      img = newImage;
      newImage = null;
    }
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const BottomBar(username: '', imagePaths: ''),
      ),
    );
  }
}
