
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:studentnot/db/db_model/data_model.dart';
import 'package:studentnot/screens/add_screen.dart';
import 'package:studentnot/screens/chart_screen.dart';
import 'package:studentnot/screens/home_screen.dart';
import 'package:studentnot/screens/note_adding.dart';
import 'package:studentnot/screens/setting_screen.dart';
import 'package:studentnot/screens/time_table.dart';

class bottombar extends StatefulWidget {
  const bottombar({super.key});

  @override
  State<bottombar> createState() => _bottombarState();
}

class _bottombarState extends State<bottombar> {
   int myindex=0;
   
    final Pages=[
       homeScreen(sub1: subdata(subtitle: '', subabout: '')),
       time_table(),
       noteaddingscreen(),
       chartViewScreen(),
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