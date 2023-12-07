import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:studentnot/bottombar.dart';
import 'package:studentnot/db/db_model/note_db.dart';

Future<void> resetDB(
  BuildContext context,
) async {
  bool confirmReset = await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black,
        title: const Text(
          "Confirm Reset",
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          "Are you sure you want to reset app\nDelete all Expense Data!",
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.orange.shade700),
            ),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
          TextButton(
            child: Text(
              "Reset",
              style: TextStyle(color: Colors.orange.shade700),
            ),
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
        ],
      );
    },
  );

  if (confirmReset == true) {
    final expenseDB = await Hive.openBox<notesData>('expense_db');
    expenseDB.clear();

    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const BottomBar(username: ''),
        ));
  }
}