
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:studentnot/screens/chart_screen.dart';
import 'package:studentnot/screens/home_screen.dart';
import 'package:studentnot/screens/note_adding.dart';
import 'package:studentnot/screens/setting_screen.dart';
import 'package:studentnot/screens/time_table.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

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
    // _loadPreferences();
  }

  // Future<void> _loadPreferences() async {
  //   prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     name = prefs.getString('name') ?? '';
  //     className = prefs.getString('class name') ?? '';
  //     imagePath = prefs.getString('imagepath') ?? '';
  //   });
  // }
    final Pages=[
       HomeScreen(),
       TimeTable([]),
       noteaddingscreen(),
       ChartScreen(),
       settingScreen()
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