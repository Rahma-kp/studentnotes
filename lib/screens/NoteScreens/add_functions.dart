import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentnot/contoller/add_note_controller.dart';
import 'package:studentnot/functions/note_function.dart';
import 'package:studentnot/model/note_model.dart';
import 'package:studentnot/screens/NoteScreens/notes_listview.dart';

Future<dynamic> onAddNoteOnClick(BuildContext context) async {
    final notesAdding = Provider.of<AddNoteProvider>(context, listen: false);
    final notetile = notesAdding.notetitilecontroller.text.trim();
    final chapt = notesAdding.chaptercontroller.text.trim();
    final category = notesAdding.categoryController.text.trim();
    final imge = notesAdding.imagelist.toList();
    if (notetile.isEmpty || chapt.isEmpty || category.isEmpty) {
      return;
    } else {
      final note1 = NotesData(
          notetitle: notetile,
          note: chapt,
          imagelists: imge,
          category: category);
      notesAdding.notetitilecontroller.clear();
      notesAdding.chaptercontroller.clear();
      notesAdding.categoryController.clear();
      notesAdding.imagelist.clear();
      addnote(note1);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => NotelistViewScreen(
                selectedsub: notesAdding.selectedsub,
                imagelistss: imge,
              )));
    }
  }

