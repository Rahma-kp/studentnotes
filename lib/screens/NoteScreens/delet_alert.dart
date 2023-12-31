import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentnot/contoller/notedb_provider.dart';
Future<dynamic> alertdeleteNote(BuildContext context, int index) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Delete Confirmation"),
        content: const Text("Are you sure you want to delete this chapter?"),
        actions: [
          TextButton(
            child: const Text("cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            onPressed: () async {
              var notdbprovider = Provider.of<notedbprovider>(context, listen: false);
              await notdbprovider.deleteNote(index);
              Navigator.of(context).pop();
            },
            child: const Text("Delete"),
          ),
        ],
      );
    },
  );
}
