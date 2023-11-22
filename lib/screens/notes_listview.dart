import 'package:flutter/material.dart';
import 'package:studentnot/db/db_functions/db_note_function.dart';
import 'package:studentnot/db/db_model/note_db.dart';
import 'package:studentnot/screens/editing_screen.dart';
import 'package:studentnot/screens/note_adding.dart';
import 'package:studentnot/screens/note_screen.dart';

class NotelistViewScreen extends StatefulWidget {
  final notesData note1;
  final String selectedsub;

  NotelistViewScreen({required this.note1, required this.selectedsub});

  @override
  State<NotelistViewScreen> createState() => _NotelistViewScreenState();
}

class _NotelistViewScreenState extends State<NotelistViewScreen> {
  String search = '';
  List<notesData> filteredNotes = [];

  @override
  void initState() {
    getAllNoteData();
    super.initState();
  }

  void filterenote() {
    setState(() {
      filteredNotes = noteListNotifier.value
          .where((notes) =>
              notes.notetitle!.toLowerCase().contains(search.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('${widget.selectedsub}',
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => noteaddingscreen()));
          },
          child: Icon(
            Icons.add,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 90, bottom: 20, left: 50, right: 50),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Color.fromARGB(153, 51, 25, 25),
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                    hintText: "Search...."),
                onChanged: (value) {
                  setState(() {
                    search = value;
                    filterenote();
                  });
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: noteListNotifier,
                builder: (BuildContext ctx, List<notesData> notelist,
                    Widget? child) {
                  // Filter notes based on the selected category
                  List<notesData> filteredNotes = notelist
                      .where((not) => not.category == widget.selectedsub)
                      .toList();

                  return ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      thickness: 5,
                    ),
                    itemCount: filteredNotes.length,
                    itemBuilder: (ctx, index) {
                      final datas = filteredNotes[index];
                      return Padding(
                        padding: const EdgeInsets.only(),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => noteViewScreen(catogery:datas.category! ,documentlist: [],imagelists: [],index: index,note:datas.note!,notetitle:datas.notetitle!,)));
                          },
                          child: ListTile(
                            tileColor: Colors.transparent,
                            title: Text(
                              " 𝐜𝐡𝐚𝐩𝐭𝐞𝐫:${datas.notetitle}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            ),
                            subtitle: Text(
                              " ${datas.note}",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                                color: Colors.black,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 2,
                            ),
                            trailing: SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              noteEditingScreen(
                                            catogery: datas.category!,
                                            documentlist: [],
                                            imagelists: [],
                                            notetitle: datas.notetitle!,
                                            note: datas.note!,
                                            index: notelist.indexOf(
                                                datas), // Correct index
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.edit,
                                        color: const Color.fromARGB(
                                            255, 81, 142, 83)),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showDeleteConfirmationDialog(
                                          context, index);
                                    },
                                    icon: Icon(Icons.delete,
                                        color: const Color.fromARGB(
                                            255, 175, 62, 54)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
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
