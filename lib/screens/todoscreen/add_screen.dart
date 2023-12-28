import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentnot/contoller/add_todo.dart';
import 'package:studentnot/functions/todo_function.dart';
import 'package:studentnot/model/todo_model.dart'; 


class AddSubject extends StatelessWidget {
  AddSubject({super.key});
  // final _subcontroller = TextEditingController();
  // final _aboutcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          title: const Text("𝐀𝐝𝐝 𝐓𝐨𝐝𝐨", style: TextStyle(color: Colors.white)),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Consumer<AddTodoProvideer>(builder: (context, value, child) => 
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: TextFormField(
                            controller:value.subcontroller,
                            decoration: const InputDecoration(
                              hintText: "Subject",
                              hintStyle: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                            style: const TextStyle(
                              fontSize: 35,
                              color: Color.fromARGB(255, 99, 96, 96),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 20),
                          child: TextFormField(
                            controller:value.aboutcontroller,
                            keyboardType: TextInputType.multiline,
                            maxLines: 700,
                            style: const TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 99, 96, 96),
                            ),
                            decoration: const InputDecoration(
                              hintText: "About.........",
                              border: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: FloatingActionButton.extended(
                  backgroundColor: const Color.fromARGB(207, 13, 20, 78),
                  onPressed: () {
                    onAddTodoButtonClick(context);
                  },
                  label: const Text(
                    "𝐒𝐚𝐯𝐞",
                    style: TextStyle(color: Colors.white, fontSize: 19),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // save button click functions-------------------------------------------------------
  Future<void> onAddTodoButtonClick(BuildContext context) async {
    final addtodo=Provider.of<AddTodoProvideer>(context,listen: false);
    final sub =addtodo.subcontroller.text.trim();
    final about = addtodo.aboutcontroller.text.trim();
    if (sub.isEmpty || about.isEmpty) {
      return;
    } else {
      final sub1 = SubData(subtitle: sub, subabout: about);
      addSub(sub1); 
      addtodo.subcontroller.clear();
      addtodo.aboutcontroller.clear();
      Navigator.of(context).pop();
    }
  }
}
