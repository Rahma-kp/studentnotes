import 'package:flutter/material.dart';
import 'package:studentnot/model/todo_model.dart';
import 'package:studentnot/services/todo_screvice.dart';

class TodoProvider extends ChangeNotifier {
  final subcontroller = TextEditingController();
  final aboutcontroller = TextEditingController();
  TodoService todoServices = TodoService();
  List<SubData> todoList = [];

  Future<void> addSub(SubData value) async {
    await todoServices.addTodo(value);
    notifyListeners();
    await getAllData();
  }

  Future<void> getAllData() async {
    todoList = await todoServices.getAllData();
    notifyListeners();
  }

  Future<void> deleteTodo(int index) async {
    await todoServices.deleteTodo(index);
    await getAllData();
    notifyListeners();
  }
}
