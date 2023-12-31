import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentnot/widget/bottombar.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController usernameController = TextEditingController();
  TextEditingController classController = TextEditingController();
  File? picked;
  final formKey = GlobalKey<FormState>();

  void getimage(ImageSource source) async {
    var img = await ImagePicker().pickImage(source: source);
    if (img != null) {
      picked = File(img.path);
      notifyListeners();
    }
  }

  Future<void> checkLogin(BuildContext ctx) async {
    final username = usernameController.text;
    final password = classController.text;

    if (username.isNotEmpty && password.isNotEmpty || picked != null) {
      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setBool('save_Key_Name', true);
      await sharedPrefs.setString('username', username);
      await sharedPrefs.setString('class', password);
      await sharedPrefs.setString('imagePath', picked?.path ?? '');

      Navigator.of(ctx).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BottomBar(
            username: username,
            imagePaths: picked?.path ?? '',
          ),
        ),
      );
    } else {
      showDialog(
        context: ctx,
        builder: (context1) {
          return AlertDialog(
            title: const Text(
              'Ooops',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            content: const Text(
              'Enter Valid Username, Password, and Capture an Image!',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context1).pop();
                },
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> checkIfAlreadyLoggedIn(BuildContext context) async {
    final sharedPrefs = await SharedPreferences.getInstance();
    final isLoggedIn = sharedPrefs.getBool('save_Key_Name') ?? false;

    if (isLoggedIn) {
      final username = sharedPrefs.getString('username') ?? '';
      final imagePath = sharedPrefs.getString('imagePath') ?? '';

      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => BottomBar(username: username, imagePaths: imagePath),
        ),
      );
    }
  }
}
