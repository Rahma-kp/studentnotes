
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:studentnot/db/db_model/timetable.dart';
import 'package:studentnot/screens/time_table.dart';

class EditTimeTable extends StatefulWidget {
  const EditTimeTable({Key? key}) : super(key: key);

  @override
  _EditTimeTableState createState() => _EditTimeTableState();
}

class _EditTimeTableState extends State<EditTimeTable> {
  late List<List<TextEditingController>> controllers;

  @override
  void initState() {
    super.initState();
    controllers = List.generate(
      6,
      (_) => List.generate(6, (_) => TextEditingController()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          elevation: 0,
          title: const Text(
            "Edit-Time-Table",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                _saveDataToHive();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TimeTable()),
                );
              },
              child: Text(
                "Save",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.edit, color: Colors.white),
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
          child: Center(
            child: Column(
              children: [
                Table(
                  border: TableBorder.all(width: 1.5),
                  children: [
                    TableRow(
                      children: [
                        Center(
                          child: Text(
                            'Days',
                            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        for (int i = 1; i <= 5; i++)
                          Center(
                            child: Text(
                              '$i',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                      ],
                    ),
                    for (int i = 0; i < 6; i++)
                      TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20, left: 10),
                            child: Text(
                              getDayName(i),
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                          for (int j = 0; j < 5; j++)
                            _buildEditTableCell(i, j),
                        ],
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String getDayName(int index) {
    // Implement a logic to get the corresponding day name based on the index.
    // For example: ['Monday', 'Tuesday', ...]
    // You can use a List<String> to store day names and return the name based on the index.
    // Remember that index 0 corresponds to 'Monday', index 1 to 'Tuesday', and so on.
    return ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'][index];
  }

  Widget _buildEditTableCell(int row, int col) {
    TextEditingController controller = controllers[row][col];

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

  void _saveDataToHive() async {
    final box = await Hive.openBox<TimeTableData>('timetableBox');

    for (int i = 0; i < 6; i++) {
      final day = getDayName(i);
      final timetableData = TimeTableData(day, controllers[i].map((controller) => controller.text).toList());
      box.add(timetableData);
    }
  }
}