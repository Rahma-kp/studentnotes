import 'package:flutter/material.dart';
import 'package:studentnot/model/note_model.dart';
import 'package:studentnot/widget/notesc.dart';

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
    await getAllNoteData();
  }

  Future<void> deleteNote(int index) async {
    await noteservices.deleteNote(index);
    await getAllNoteData();
  }

  Future<void> editnote(index, NotesData value) async {
    await noteservices.editnote(index, value);
    notifyListeners();
    await getAllNoteData();
  }
}
