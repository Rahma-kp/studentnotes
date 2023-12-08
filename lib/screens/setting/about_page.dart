import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: const Color.fromARGB(207, 13, 20, 78),
          title: Text(
            "𝐀𝐛𝐨𝐮𝐭",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(''' 
              Welcome to the MyNote! 
        
              Mynote make easy study!
        
          A MyNote app  designed to help store , monitor and manage their notes.
          These including doument and images also we can store daily bases notes.
          The primary goal of an mynote is to provide users with a comprehensive overview of their spending 
          patterns,enabling them to make informed decisions about their study.
        .
        
             
        
              Is Mynote a safe app:-
        
        Easy Tracker does not handle any cash transactions,nor does it link to personal banking details,making it safer than other Apps. 
        
        
        
        
        
        
        
        
                               Explore the features ! ''')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
