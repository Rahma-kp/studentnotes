
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:studentnot/db/db_functions/db_functions.dart';
import 'package:studentnot/db/db_functions/db_note_function.dart';
import 'package:studentnot/db/db_model/data_model.dart';
import 'package:studentnot/db/db_model/note_db.dart';
import 'package:studentnot/screens/splsh_screen.dart';


const String SAVE_KEY_NAME = 'user_logged_in';

 Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
 if(!Hive.isAdapterRegistered(SubDataAdapter().typeId)){
  Hive.registerAdapter(SubDataAdapter());
 }
 WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
 if(!Hive.isAdapterRegistered(notesDataAdapter().typeId)){
  Hive.registerAdapter(notesDataAdapter());
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