
// ignore_for_file: non_constant_identifier_names

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:studentnot/screens/chart_screen.dart';
import 'package:studentnot/screens/home_screen.dart';
import 'package:studentnot/screens/note_adding.dart';
import 'package:studentnot/screens/setting/setting_screen.dart';
import 'package:studentnot/screens/todaylist.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key, required String username});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
   int myindex=0;

  //  late SharedPreferences prefs;
  String name = '';
  String className = '';
  String imagePath = '';

  @override
  void initState() {
    super.initState();
  }

 
    final Pages=[
       const HomeScreen(),
       TodoList(),
       const NoteAdding(),
       const PieChart(),
       const settingScreen()
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
       body: Pages[myindex],
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          animationDuration: const Duration(microseconds: 300),
          onTap: (index) {
            setState(() {
              myindex=index;
            });
            
          },
          items: const [
            Icon(Icons.home),
            Icon(Icons.calendar_month_outlined),
            Icon(Icons.add),
            Icon(Icons.bar_chart_sharp),
            Icon(Icons.settings)
          ]));
  }
}