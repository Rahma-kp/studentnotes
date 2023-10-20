
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:studentnot/screens/add_screen.dart';
import 'package:studentnot/screens/chart_screen.dart';
import 'package:studentnot/screens/home_screen.dart';
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
      home_screen(),
      time_table(),
      add_screen(),
      chart_screen(),
      setting_screen()
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
       body: Pages[myindex],
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromARGB(207, 13, 20, 78),
          animationDuration: Duration(microseconds: 300),
          onTap: (index) {
            setState(() {
              myindex=index;
            });
            
          },
          items: [
            Icon(Icons.home),
            Icon(Icons.calendar_month_outlined),
            Icon(Icons.add),
            Icon(Icons.bar_chart_sharp),
            Icon(Icons.settings)
          ]));
  }
}