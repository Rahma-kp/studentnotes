import 'package:flutter/material.dart';
import 'package:studentnot/screens/editing_screen.dart';
import 'package:studentnot/screens/list_adding_screen.dart';
import 'package:studentnot/screens/note_screen.dart';

class listview_screen extends StatelessWidget {
  const listview_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mathematics"),
        backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        elevation: 0,
      ),
      body: ListView(children: [
        ListTile(
          leading: Image.asset(
            "assets/images/m1.jpeg",
            height: 70,
            width: 70,
          ),
          title: const Text(
            "Chapter:1",
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          subtitle: const Text(
              "Ttigonometry,the branch of mathematics concernd  whith specific functions of angle and their application to calculate"),
          trailing: SizedBox(
            height: 40,
            width: 100,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const editing_screen(),
                      ));
                    },
                    icon: const Icon(Icons.edit)),
                IconButton(onPressed: () {
                  return  showDeleteConfirmationDialog(context);
                }, icon: const Icon(Icons.delete))
              ],
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const note_screen(),
            ));
          },
        ),
        const Divider(thickness: 2,),
        ListTile(
          leading: Image.asset(
            "assets/images/m1.jpeg",
            height: 70,
            width: 70,
          ),
          title: const Text(
            "Chapter:2",
            style: TextStyle(fontSize: 20, color: Colors.black54),
          ),
          subtitle: const Text(
              "Algebra is the study of variables and the rule for manipulating these variable information"),
          trailing: SizedBox(
            height: 40,
            width: 100,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const editing_screen(),
                      ));
                    },
                    icon: const Icon(Icons.edit)),
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete))
              ],
            ),
          ),
          onTap: () {},
        ),
        const Divider(thickness: 2,)
      ]),
      // ------------------------listview bulider----------------------------------------------------------------------------
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  list_adding_screen(),
          ));
        },
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromARGB(207, 13, 20, 78),
      ),
    );
  }

  // delete dialog box method----------------------------------------------------------
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
