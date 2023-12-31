import 'package:flutter/material.dart';
import 'package:studentnot/model/note_model.dart';
import 'package:studentnot/widget/note_services.dart';

class notedbprovider extends ChangeNotifier {
  List<String> filteredsubject = [];
  List<NotesData>filteredNote=[];
  List<NotesData> noteList = [];
  NoteServices noteservices = NoteServices();

  Future<void> getAllNoteData() async {
    noteList = await noteservices.getAllNoteData();
    notifyListeners();
  }

  Future<void> addnote(NotesData value) async {
    await noteservices.addnote(value);
    notifyListeners();
    await getAllNoteData();
  }
  Future<void> deleteNote(int index) async {
  print('Deleting note at index: $index');
  await noteservices.deleteNote(index);
  notifyListeners();
  await getAllNoteData();
}


  Future<void> editnote(index, NotesData value) async {
    await noteservices.editnote(index, value);
    notifyListeners();
    await getAllNoteData();
  }
}
