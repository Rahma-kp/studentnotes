import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentnot/contoller/tododb_provider.dart';
import 'package:studentnot/model/todo_model.dart';

Future<dynamic>  addTodo(BuildContext context) async {
    final addtodo = Provider.of<TodoProvider>(context, listen: false);
    final sub = addtodo.subcontroller.text.trim();
    final about = addtodo.aboutcontroller.text.trim();
    if (sub.isEmpty || about.isEmpty) {
      return;
    } else {
      final sub1 = SubData(subtitle: sub, subabout: about);
      addtodo.addSub(sub1);
      addtodo.subcontroller.clear();
      addtodo.aboutcontroller.clear();
      Navigator.of(context).pop();
    }
  }