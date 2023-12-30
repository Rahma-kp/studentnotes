import 'dart:io';

import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  File? _profileImage;
  File? _newImage;

  File? get profileImage => _profileImage;
  File? get newImage => _newImage;

  void setProfileImage(File image) {
    _profileImage = image;
    notifyListeners();
  }

  void setNewImage(File image) {
    _newImage = image;
    notifyListeners();
  }

  void clearNewImage() {
    _newImage = null;
    notifyListeners();
  }
}
