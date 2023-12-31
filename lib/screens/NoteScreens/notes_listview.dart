import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentnot/contoller/notedb_provider.dart';
import 'package:studentnot/model/note_model.dart';
import 'package:studentnot/screens/NoteScreens/delet_alert.dart';
import 'package:studentnot/screens/NoteScreens/note_editing.dart';
import 'package:studentnot/screens/NoteScreens/note_screen.dart';
import 'package:studentnot/screens/NoteScreens/note_screen.dart';
import 'package:studentnot/widget/bottombar.dart';

class NotelistViewScreen extends StatefulWidget {
  final String selectedsub;
  final List imagelistss;
  const NotelistViewScreen({
    super.key,
    required this.selectedsub,
    required this.imagelistss,
  });

  @override
  State<NotelistViewScreen> createState() => _NotelistViewScreenState();
}

class _NotelistViewScreenState extends State<NotelistViewScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<notedbprovider>(context, listen: false).getAllNoteData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        const BottomBar(username: '', imagePaths: ''),
                  ));
                },
                icon: const Icon(Icons.arrow_back)),
            iconTheme: const IconThemeData(color: Colors.white),
            title: Text(widget.selectedsub,
                style: const TextStyle(color: Colors.white)),
            backgroundColor: const Color.fromARGB(207, 13, 20, 78),
            elevation: 0,
          ),
          body: Consumer<notedbprovider>(builder: (context, value, child) {
            List<NotesData> filteredNotes = value.noteList
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
                              imagelists: datas.imagelists!,
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
                              alertdeleteNote(context, index);
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
          })),
    );
  }
}
