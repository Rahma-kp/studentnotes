import 'package:flutter/material.dart';
import 'package:studentnot/db/db_functions/db_note_function.dart';
import 'package:studentnot/db/db_model/note_db.dart';
import 'package:studentnot/screens/editing_screen.dart';
import 'package:studentnot/screens/note_screen.dart';

class NotelistViewScreen extends StatelessWidget {

  notesData note1;

  NotelistViewScreen({Key? key, required this.note1,}) : super(key: key);
  List notelist = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("notes",style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        elevation: 0,
      ),
      body: ValueListenableBuilder(
        valueListenable: noteListNotifier,
        builder: (BuildContext ctx, List<notesData> notelist, Widget? child) {
          return ListView.separated(
            separatorBuilder: (context, index) => Divider(
              thickness: 5,
            ),
            itemCount: notelist.length, // Use notelist.length as the item count
            itemBuilder: (ctx, index) {
              final datas = notelist[index];
              return Padding(
                padding: const EdgeInsets.only(),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => noteViewScreen(),));
                  },
                  child: ListTile(
                    tileColor: Colors.transparent,
                    title: Text(
                      " 𝐜𝐡𝐚𝐩𝐭𝐞𝐫:${datas.notetitle}",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,),
                    ),
                    subtitle: Text(
                    " ${datas.note}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                        
                        
                      ),
                      maxLines:2,
                    ),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => noteEditingScreen(),
                              ));
                            },
                            icon: Icon(Icons.edit,
                                color: const Color.fromARGB(255, 81, 142, 83)),
                          ),
                          IconButton(
                            onPressed: () {
                              showDeleteConfirmationDialog(context,index);
                            },
                            icon: Icon(Icons.delete,
                                color: const Color.fromARGB(255, 175, 62, 54)),
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
     
    );
  }

  void showDeleteConfirmationDialog(BuildContext context,index) {
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
              onPressed: () {
                deleteNote(index);
              },
              child: Text("Delete"),
            ),
          ],
        );
      },
    );
  }
}
