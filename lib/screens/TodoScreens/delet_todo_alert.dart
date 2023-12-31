import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentnot/contoller/tododb_provider.dart';
Future<dynamic> alertDeleteTodo(BuildContext context, int index) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Delete Confirmation"),
        content: const Text("Are you sure you want to delete?"),
        actions: [
          TextButton(
            child: const Text("cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            onPressed: () async {
              var notdbprovider = Provider.of<TodoProvider>(context, listen: false);
              await notdbprovider.deleteTodo(index);
              Navigator.of(context).pop();
            },
            child: const Text("Delete"),
          ),
        ],
      );
    },
  );
}
