import 'package:flutter/material.dart';
import 'package:studentnot/db/db_functions/db_note_function.dart';
import 'package:studentnot/db/db_model/note_db.dart';
import 'package:studentnot/screens/editing_screen.dart';
import 'package:studentnot/screens/note_adding.dart';
import 'package:studentnot/screens/note_screen.dart';
import 'package:studentnot/widget/bottombar.dart';

class NotelistViewScreen extends StatefulWidget {
  final String selectedsub;
  final List imagelistss;
  final List documentlistss;
  const NotelistViewScreen({
    required this.selectedsub,
     required this.imagelistss,
     required this.documentlistss,
  });

  @override
  State<NotelistViewScreen> createState() => _NotelistViewScreenState();
}

class _NotelistViewScreenState extends State<NotelistViewScreen> {
  @override
  void initState() {
    super.initState();
    getAllNoteData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => BottomBar(username: ''),
                ));
              },
              icon: Icon(Icons.arrow_back)),
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(widget.selectedsub,
              style: const TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => NoteAdding()),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: noteListNotifier,
          builder: (BuildContext ctx, List<NotesData> notelist, Widget? child) {
            List<NotesData> filteredNotes = notelist
                .where((not) => not.category == widget.selectedsub)
                .toList();

            return ListView.builder(
              itemCount: filteredNotes.length,
              itemBuilder: (ctx, index) {
                final datas = filteredNotes[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => NoteViewScreen(
                              notetitle: datas.notetitle!,
                              note: datas.note!,
                              catogery: datas.category!,
                              documentlist: datas.documentlist!,
                              imagelists:datas.imagelists!,
                              index: index,
                            ),
                          ),
                        );
                      },
                      title: Text(
                        " 𝐜𝐡𝐚𝐩𝐭𝐞𝐫:${datas.notetitle}",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        datas.note!,
                        style: const TextStyle(fontSize: 16),
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
                            icon: const Icon(Icons.edit,
                                color: Color.fromARGB(255, 81, 142, 83)),
                          ),
                          IconButton(
                            onPressed: () {
                              showDeleteConfirmationDialog(context, index);
                            },
                            icon: const Icon(Icons.delete,
                                color: Color.fromARGB(255, 175, 62, 54)),
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
          title: const Text("Delete Confirmation"),
          content: const Text("Are you sure you want to delete this chapter?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () async {
                await deleteNote(index);
                Navigator.of(context).pop();
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
