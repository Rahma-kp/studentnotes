import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentnot/model/note_model.dart';
import 'package:studentnot/model/todo_model.dart';
import 'package:studentnot/view/login_screen.dart';


class ReSet extends ChangeNotifier {
  resetApp(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: const Text(
              'Do you want to Reset app',
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Cancel',
                  )),
                  TextButton(
                onPressed: (() async {
                  Navigator.of(context).pop();
                  final notDB= await Hive.openBox<NotesData>("note_db");
                  notDB.clear();
                  final subDB= await Hive.openBox<SubData>("subdata_db");
                  subDB.clear();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );

                  SharedPreferences prefe =
                      await SharedPreferences.getInstance();
                  await prefe.clear();
                }),
                child: const Text(
                  'Yes',
                ),
              ),

            ],
          );
        });
  }
}