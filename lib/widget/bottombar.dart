import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentnot/contoller/bottombar_provider.dart';
import 'package:studentnot/screens/chartscreens/chart_screen.dart';
import 'package:studentnot/screens/home_screen.dart';
import 'package:studentnot/screens/NoteScreens/note_adding.dart';
import 'package:studentnot/screens/SettingScreens/setting_screen.dart';
import 'package:studentnot/screens/TodoScreens/todolist.dart';

class BottomBar extends StatelessWidget {
  final String username;
  final String imagePaths;

  const BottomBar({Key? key, required this.username, required this.imagePaths}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomBarProvider = Provider.of<BottomBarProvider>(context);
    int myindex = bottomBarProvider.currentIndex;

    final pages = [
      HomeScreen(username: username, imagePaths: '',),
      TodoList(),
      const NoteAdding(),
      const PieChart(),
      const SettingScreen(),
    ];

    return Scaffold(
      body: pages[myindex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color.fromARGB(207, 13, 20, 78),
        animationDuration: const Duration(microseconds: 300),
        onTap: (index) {
          bottomBarProvider.updateIndex(index);
        },
        items: const [
          Icon(Icons.home),
          Icon(Icons.calendar_month_outlined),
          Icon(Icons.add),
          Icon(Icons.bar_chart_sharp),
          Icon(Icons.settings),
        ],
      ),
    );
  }
}
