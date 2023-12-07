import 'package:flutter/material.dart';
import 'package:studentnot/screens/setting/about_page.dart';
import 'package:studentnot/screens/setting/logout.dart';
import 'package:studentnot/screens/setting/restart.dart';
import 'package:studentnot/screens/setting/terms_screen.dart';

class settingScreen extends StatelessWidget {
  const settingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          elevation: 0,
          title: const Text(
            "𝐒𝐞𝐭𝐭𝐢𝐧𝐠𝐬",
            style: TextStyle(color: Colors.white),
          ),
        ),
        endDrawer: Drawer(),
        body: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.info_outline),
              title: const Text("About"),
              trailing: const Text(
                ">",
                style: TextStyle(fontSize: 30),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => About(),
                ));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.document_scanner),
              title: const Text("Term & conditions"),
              trailing: const Text(
                ">",
                style: TextStyle(fontSize: 30),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => terms(),
                ));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.restore_outlined),
              title: const Text("Reset App"),
              trailing: const Text(
                ">",
                style: TextStyle(fontSize: 30),
              ),
              onTap: () {
              reset().resetApp(context);
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text("Logout"),
              trailing: const Text(
                ">",
                style: TextStyle(fontSize: 30),
              ),
              onTap: () {
                exitpopup(context);
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
