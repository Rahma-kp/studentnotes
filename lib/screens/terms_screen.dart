import 'package:flutter/material.dart';


class terms extends StatelessWidget {
  const terms({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:const Color.fromARGB(207, 13, 20, 78),),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Terms and conditions',
                  style:
                      TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 30,
              ),
              Text(''' 
            Welcome to the notes App! By using this app, you agree to these simple terms:

  1:- Use Responsibly: The notes App is designed to help you store notes,document and images. Use it responsibly and enjoy your studiying experience!

  2:- Your Content: Any notes and images you add are your responsibility. Make sure they are accurate and safe to use.

  3:- Respect Privacy: We care about your privacy. Your use of the app is subject to our Privacy Policy.

  4:- App Ownership: The Notes App and its content belong to us. Please don't modify, distribute, or reverse engineer the app without our permission.

  5:- App Changes: We might update the app or these terms. Stay tuned for any announcements from us.

  6:- App Availability: We aim to provide the app 24/7, but we can't guarantee it. We're not responsible for any inconvenience caused by app unavailability.

  7:- Get in Touch: If you have questions, reach out to us at kprahma7384@gemail.com

            By using the note App, you agree to these terms. Enjoy your studying adventures! ''')
            ],
          ),
        ),
      ),
    );
  }
}
