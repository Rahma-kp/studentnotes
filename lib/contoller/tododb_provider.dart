import 'package:flutter/material.dart';
import 'package:studentnot/model/todo_model.dart';
import 'package:studentnot/widget/todo_screvice.dart';

class TodoProvider extends ChangeNotifier {
  final subcontroller = TextEditingController();
  final aboutcontroller = TextEditingController();
  TodoService todoServices = TodoService();
  List<SubData> TodoList = [];

  Future<void> addSub(SubData value) async {
    await todoServices.AddTodo(value);
    notifyListeners();
    await getAllData();
  }

  Future<void> getAllData() async {
    TodoList = await todoServices.getAllData();
    notifyListeners();
  }

  Future<void> deleteTodo(int index) async {
    await todoServices.deleteTodo(index);
    await getAllData();
    notifyListeners();
  }
}
