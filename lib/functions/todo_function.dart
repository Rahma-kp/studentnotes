import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:studentnot/model/todo_model.dart';

ValueNotifier<List<SubData>>subListNotifier= ValueNotifier([]);

Future<void> addSub(SubData value) async{

  final subDB= await Hive.openBox<SubData>("subdata_db");
  await subDB.add(value);
  subListNotifier.value.add(value);
  subListNotifier.notifyListeners();
}
Future<void> getAlldata()async{
  final subDB= await Hive.openBox<SubData>("subdata_db");
  subListNotifier.value.clear();
  subListNotifier.value.addAll(subDB.values);
  subListNotifier.notifyListeners();
}
Future<void> deleteTodo(int index)async{
  final notDB= await Hive.openBox<SubData>("subdata_db"); 
   await notDB.deleteAt(index);
  getAlldata();
}