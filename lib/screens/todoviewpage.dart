import 'package:flutter/material.dart';
import 'package:studentnot/db/db_functions/db_functions.dart';
import 'package:studentnot/db/db_model/data_model.dart';

class TodoviewPage extends StatelessWidget {
  final int selectedIndex;
  final Color selectedColor;

  TodoviewPage({Key? key, required this.selectedIndex, required this.selectedColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    subdata selectedData = SubListNotifier.value[selectedIndex];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: selectedColor, 
          title: Text('𝐓𝐨 𝐃𝐨', style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text(selectedData.subtitle, style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
                  Center(child: Text(selectedData.subabout, style: TextStyle(fontSize: 20))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
