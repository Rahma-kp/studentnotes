import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:studentnot/model/note_model.dart';

ValueNotifier<List<NotesData>>noteListNotifier= ValueNotifier([]);

Future<void> addnote(NotesData value) async{
  final notDB= await Hive.openBox<NotesData>("note_db");
  await notDB.add(value);
  noteListNotifier.value.add(value); 
  noteListNotifier.notifyListeners();
}
Future<void> getAllNoteData()async{
  final notDB= await Hive.openBox<NotesData>("note_db");
  noteListNotifier.value.clear();
  noteListNotifier.value.addAll(notDB.values);
  noteListNotifier.notifyListeners();
}

Future<void> deleteNote(int index)async{
  final notDB= await Hive.openBox<NotesData>("note_db"); 
   await notDB.deleteAt(index);
  getAllNoteData();
}

Future<void>editnote(index, NotesData value) async {
  final notDB = await Hive.openBox<NotesData>('note_db');
  noteListNotifier.value.clear();
  noteListNotifier.value.addAll(notDB.values);
  noteListNotifier.notifyListeners();
  notDB.putAt(index, value);
  getAllNoteData();
}