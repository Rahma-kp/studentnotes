import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentnot/contoller/tododb_provider.dart';
import 'package:studentnot/screens/todoscreen/add_screen.dart';
import 'package:studentnot/screens/todoscreen/todoviewpage.dart';

class TodoList extends StatefulWidget {
   const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<Color> gridcolor = [
    const Color.fromARGB(255, 220, 160, 160),
    const Color.fromARGB(255, 139, 193, 141),
    const Color.fromARGB(255, 135, 167, 194),
    const Color.fromARGB(255, 219, 164, 80),
    const Color.fromARGB(255, 203, 107, 100),
  ];

  @override
  void initState() { 
    Provider.of<TodoProvider>(context, listen: false).getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          title: const Text('𝐓𝐨𝐝𝐚𝐲 𝐋𝐢𝐬𝐭', style: TextStyle(color: Colors.white)),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddSubject(),
            ));
          },
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          child: const Icon(Icons.add, color: Colors.white),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Builder(builder: (context) {
                return Consumer<TodoProvider>(builder: (context, value, child) {
                  return SizedBox(
                    height: 500,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemCount: value.TodoList.length,
                      itemBuilder: (context, index) {
                        final data = value.TodoList[index];
                        final backgroundColor = gridcolor[index % gridcolor.length];
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => TodoviewPage(
                                  selectedIndex: index,
                                  selectedColor: backgroundColor,
                                ),
                              ));
                            },
                            onLongPress: () {
                              tododeleteconfirmationdialog(context, index);
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
                                        style: const TextStyle(
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
                });
              })
            ],
          ),
        ),
      ),
    );
  }

  // ----------delete showdialog-------------------------------------
  void tododeleteconfirmationdialog(BuildContext context, int index) {
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
                Provider.of<TodoProvider>(context, listen: false).deleteTodo(index);
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
