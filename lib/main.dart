
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:studentnot/functions/note_function.dart';
import 'package:studentnot/functions/todo_function.dart';
import 'package:studentnot/model/note_model.dart';
import 'package:studentnot/model/todo_model.dart';
import 'package:studentnot/screens/splsh_screen.dart';


const String save_Key_Name = 'user_logged_in';

 Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
 if(!Hive.isAdapterRegistered(SubDataAdapter().typeId)){
  Hive.registerAdapter(SubDataAdapter());
 }
 WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
 if(!Hive.isAdapterRegistered(NotesDataAdapter().typeId)){
  Hive.registerAdapter(NotesDataAdapter());
 }
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    getAlldata();
    getAllNoteData();
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );
  }
}