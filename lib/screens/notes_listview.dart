import 'dart:io';

import 'package:flutter/material.dart';
import 'package:studentnot/db/db_functions/db_note_function.dart';
import 'package:studentnot/db/db_model/note_db.dart';
import 'package:studentnot/screens/editing_screen.dart';
import 'package:studentnot/screens/note_adding.dart';
import 'package:studentnot/screens/note_screen.dart';

class NotelistViewScreen extends StatefulWidget {
  final String selectedsub;
  NotelistViewScreen({required this.selectedsub,});

  @override
  State<NotelistViewScreen> createState() => _NotelistViewScreenState();
}

class _NotelistViewScreenState extends State<NotelistViewScreen> {
  @override
  void initState() {
    super.initState();
    getAllNoteData();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(widget.selectedsub, style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(backgroundColor: Color.fromARGB(207, 13, 20, 78),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => noteaddingscreen()));
          },
          child: Icon(
            Icons.add,color: Colors.white,
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: noteListNotifier,
          builder: (BuildContext ctx, List<notesData> notelist, Widget? child) {
            List<notesData> filteredNotes = notelist
                .where((not) => not.category == widget.selectedsub)
                .toList();
      
            return ListView.builder(
        itemCount: filteredNotes.length,
        itemBuilder: (ctx, index) {
      final datas = filteredNotes[index];
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5, // Add elevation for a shadow effect
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => noteViewScreen(
                    notetitle: datas.notetitle!,
                    note: datas.note!,
                    catogery: datas.category!,
                    documentlist:datas.documentlist!,
                    imagelists: datas.imagelists!,
                    index: index,
                  ),
                ),
              );
            },
            title: Text(
               " 𝐜𝐡𝐚𝐩𝐭𝐞𝐫:${datas.notetitle}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              datas.note!,
              style: TextStyle(fontSize: 16),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => NotEditingScreen(
                          catogery: datas.category!,
                          documentlist: datas.documentlist!,
                          imagelists: datas.imagelists!,
                          notetitle: datas.notetitle!,
                          note: datas.note!,
                          index: index,
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.edit, color: const Color.fromARGB(255, 81, 142, 83)),
                ),
                IconButton(
                  onPressed: () {
                    showDeleteConfirmationDialog(context, index);
                  },
                  icon: Icon(Icons.delete, color: const Color.fromARGB(255, 175, 62, 54)),
                ),
              ],
            ),
          ),
        ),
      );
        },
      );
      
          },
        ),
      ),
    );
  }

  void showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Delete Confirmation"),
          content: Text("Are you sure you want to delete this chapter?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                await deleteNote(index);
                Navigator.of(context).pop();
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
