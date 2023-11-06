import 'package:flutter/material.dart';
import 'package:studentnot/db/db_functions/db_note_function.dart';
import 'package:studentnot/db/db_model/note_dbmodel.dart';
import 'package:studentnot/screens/editing_screen.dart';
import 'package:studentnot/screens/list_adding_screen.dart';
import 'package:studentnot/screens/note_screen.dart';

class listview_screen extends StatelessWidget {
  notesData note1;

   listview_screen({Key? key,required this.note1}) : super(key:key);
   List notelist=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mathematics"),
        backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        elevation: 0,
      ),
      body: ValueListenableBuilder(
        valueListenable: noteListNotifier,
        builder: (BuildContext ctx, List<notesData> notelist, Widget? child) {
          return ListView.builder(
            itemCount: notelist.length, // Use notelist.length as the item count
            itemBuilder: (ctx, index) {
                final datas = notelist[index];
                return ListTile(
                  title: Text(datas.notetitle!,style: TextStyle(fontSize:40,fontWeight: FontWeight.bold),),
                  subtitle: Text(datas.note!,style: TextStyle(fontSize: 20),),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            showDeleteConfirmationDialog(context);
                          },
                          icon: Icon(Icons.edit),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => editing_screen(),));
                          },
                          icon: Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => list_adding_screen(),
          ));
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(207, 13, 20, 78),
      ),
    );
  }

  void showDeleteConfirmationDialog(BuildContext context) {
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
