import 'package:flutter/material.dart';
import 'package:flutter_timetable/flutter_timetable.dart';
import 'package:studentnot/screens/edit_timetable.dart';

class TimeTable extends StatelessWidget {
  TimeTable({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          elevation: 0,
          title: const Text(
            "Time-table",
            style: TextStyle(color: Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => EditTimeTable()));
          },
          child: const Icon(Icons.edit, color: Colors.white),
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Center(
            child: Column(children: [
              Table(
                border: TableBorder.all(width: 1.5),
                children: [
                  TableRow(children: [
                    Center(
                        child: Text(
                      'Days',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    )),
                    Center(
                        child: Text(
                      '1',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Center(
                        child: Text(
                      '2',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Center(
                        child: Text(
                      '3',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Center(
                        child: Text(
                      '4',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
                    Center(
                        child: Text(
                      '5',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Text(
                        'MonaDay',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Text(
                        'TuesDay',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                     Text(''),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Text(
                        'WednesDay',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Text(
                        'ThursDay',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Text(
                        'FriDay',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Text(
                        'SaturDay',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''),
                    Text(''), 
                  ]),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

Widget _buildEditTableCell(String initialValue) {
  TextEditingController controller = TextEditingController(text: initialValue);

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide.none),
      ),
    ),
  );
}
