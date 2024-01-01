import 'package:hive/hive.dart';
import 'package:studentnot/model/note_model.dart';

class NoteServices{
    Future<List<NotesData>> getAllNoteData()async{
     final notDB = await Hive.openBox<NotesData>('note_db');
     return notDB.values.toList();
   }
   Future<void> addnote(NotesData value)async{
   final notDB = await Hive.openBox<NotesData>('note_db');
   
   await notDB.add( value);
   }
    Future<void> deleteNote(int index) async {
  final notDB = await Hive.openBox<NotesData>('note_db');
  notDB.deleteAt(index);
}
Future<void> editnote(index,NotesData value ) async {
  final notDB = await Hive.openBox<NotesData>('note_db');
  notDB.putAt(index, value);
}

}