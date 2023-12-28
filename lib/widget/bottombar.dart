import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studentnot/screens/chartscreens/chart_screen.dart';
import 'package:studentnot/screens/home_screen.dart';
import 'package:studentnot/screens/notesscreens/note_adding.dart';
import 'package:studentnot/screens/setting/setting_screen.dart';
import 'package:studentnot/screens/todoscreen/todaylist.dart';
class BottomBar extends StatefulWidget {
  final String username;

  const BottomBar({super.key, required this.username, required String imagePaths});

  @override
  State<BottomBar> createState() => _BottomBarState();
}class _BottomBarState extends State<BottomBar> {
  int myindex = 0;
  late String name;
  late String imagePathmm='';

  @override
  void initState() {
    super.initState();
    initializeUserData();
  }

  Future<void> initializeUserData() async {
    await loadUserData();
  }

  Future<void> loadUserData() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    setState(() {
      name = sharedPrefs.getString('username') ?? '';
      imagePathmm = sharedPrefs.getString('imagePath') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (imagePathmm.isEmpty) {
      return  Image.asset('assets/images/person1.png');
    }

    final pages = [
      HomeScreen(imagePaths: imagePathmm, username: name),
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
          setState(() {
            myindex = index;
          });
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
