import 'package:flutter/material.dart';
import 'package:studentnot/db/db_functions/db_functions.dart';
import 'package:studentnot/db/db_model/data_model.dart';

class TodoviewPage extends StatelessWidget {
  final int selectedIndex;
  final Color selectedColor;

  const TodoviewPage({super.key, required this.selectedIndex, required this.selectedColor});

  @override
  Widget build(BuildContext context) {
    SubData selectedData = subListNotifier.value[selectedIndex];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: selectedColor, 
          title: const Text('𝐓𝐨 𝐃𝐨', style: TextStyle(color: Colors.white)),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Text(selectedData.subtitle, style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold))),
                  Center(child: Text(selectedData.subabout, style: const TextStyle(fontSize: 20))),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
