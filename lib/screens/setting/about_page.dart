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
        
              Easy Tracker makes life easier!
        
          A Easy Tracker app  designed to help individuals to monitor and manage their financial transactions.
          These transactions can include everything from daily purchases and bills to larger expenses like rent and investments.
          The primary goal of an expense tracker is to provide users with a comprehensive overview of their spending 
          patterns,enabling them to make informed decisions about their finances.
        .
        
             
        
              Is Easy Pay a safe app:-
        
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
