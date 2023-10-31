import 'package:flutter/material.dart';
import 'package:studentnot/bottombar.dart';
import 'package:studentnot/db/db_functions/db_functions.dart';
import 'package:studentnot/db/db_model/data_model.dart';

class add_screen extends StatelessWidget {
  add_screen({super.key});
  final _subcontroller = TextEditingController();
  final _aboutcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          title: const Text("Add Subject"),
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: TextField(
                          controller: _subcontroller,
                          decoration: InputDecoration(
                            hintText: "Subject",
                            hintStyle: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                            border: UnderlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 35,
                            color: Color.fromARGB(255, 99, 96, 96),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 30, right: 20),
                        child: TextField(
                          controller: _aboutcontroller,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 99, 96, 96),
                          ),
                          decoration: InputDecoration(
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
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: FloatingActionButton.extended(
                  backgroundColor: const Color.fromARGB(207, 13, 20, 78),
                  onPressed: () {
                    onAddSubjectButtonClick(context);
                  },
                  label: const Text("Save"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onAddSubjectButtonClick(BuildContext context) async {
    final _sub = _subcontroller.text.trim();
    final _about = _aboutcontroller.text.trim();
    if (_sub.isEmpty || _about.isEmpty) {
      return;
    } else {
      print('$_sub');
      print('$_about');

      final _sub1 = subdata(subtitle: _sub, subabout: _about);
      addSub(_sub1);

      // Clear the text fields
      _subcontroller.clear();
      _aboutcontroller.clear();

      // Navigate to the bottombar screen
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => bottombar()));
    }
  }
}
