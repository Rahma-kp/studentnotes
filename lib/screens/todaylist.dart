// TodoList.dart

import 'package:flutter/material.dart';
import 'package:studentnot/db/db_functions/db_functions.dart';
import 'package:studentnot/db/db_model/data_model.dart';
import 'package:studentnot/screens/add_screen.dart';
import 'package:studentnot/screens/todoviewpage.dart';

class TodoList extends StatelessWidget {
  final List<Color> gridcolor = [
    Color.fromARGB(255, 220, 160, 160),
    const Color.fromARGB(255, 139, 193, 141),
    const Color.fromARGB(255, 135, 167, 194),
    const Color.fromARGB(255, 219, 164, 80),
    const Color.fromARGB(255, 203, 107, 100)
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          title: Text('𝐓𝐨𝐝𝐚𝐲 𝐋𝐢𝐬𝐭', style: TextStyle(color: Colors.white)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => addSubejectScreen(),
            ));
          },
          child: Icon(Icons.add, color: Colors.white),
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Builder(builder: (context) {
                return ValueListenableBuilder<List<subdata>>(
                  valueListenable: SubListNotifier,
                  builder: (BuildContext ctx, List<subdata> subList, Widget? child) {
                    return Container(
                      height: 500,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: subList.length,
                        itemBuilder: (context, index) {
                          final data = subList[index];
                          final backgroundColor =
                              gridcolor[index % gridcolor.length];
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => TodoviewPage(selectedIndex: index,selectedColor: backgroundColor,),
                                ));
                              },
                              onLongPress: () {
                                TodoDeleteConfirmationDialog(context, index);
                              },
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: backgroundColor,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Title(
                                        color: Colors.black,
                                        child: Text(
                                          data.subtitle,
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        data.subabout,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }

  void TodoDeleteConfirmationDialog(BuildContext context, int index) {
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
                deleteTodo(index);
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
