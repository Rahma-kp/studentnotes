
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:studentnot/contoller/add_note_controller.dart';
import 'package:studentnot/contoller/add_todo.dart';
import 'package:studentnot/contoller/bottombar_provider.dart';
import 'package:studentnot/contoller/home.dart';
import 'package:studentnot/contoller/home_screen.dart';
import 'package:studentnot/contoller/note_editing_controller.dart';
import 'package:studentnot/contoller/notedb_provider.dart';
import 'package:studentnot/contoller/profile_provider.dart';
import 'package:studentnot/contoller/tododb_provider.dart';
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
    return MultiProvider(providers: [
      ChangeNotifierProvider<ProfileProvider>(create: (_)=>ProfileProvider()),
      ChangeNotifierProvider<BottomBarProvider>(create: (_)=>BottomBarProvider()),
      ChangeNotifierProvider<TodoProvider>(create: (_)=>TodoProvider()),
      ChangeNotifierProvider<HomeScreenProvider>(create: (_)=>HomeScreenProvider(username: '', imagePaths:'', subject:[], category:[])),
      // ChangeNotifierProvider<homeprovider>(create: (_)=>homeprovider(username: '', imagePaths: '')), 
      ChangeNotifierProvider<notedbprovider>(create: (_)=>notedbprovider()),
      ChangeNotifierProvider<AddNoteProvider>(create: (_)=>AddNoteProvider()),
      ChangeNotifierProvider<NotEditingProvider>(create: (_)=>NotEditingProvider(notetitle: '', note: '', category:'', imagelists:[])),
      ChangeNotifierProvider<TodoViewProvider>(create: (_)=>TodoViewProvider()),
    ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:SplashScreen(),
      ),
    );
  }
}