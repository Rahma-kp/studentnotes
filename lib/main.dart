
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:studentnot/bottombar.dart';
import 'package:studentnot/db/db_functions/db_functions.dart';
import 'package:studentnot/db/db_model/data_model.dart';



 Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
 if(!Hive.isAdapterRegistered(subdataAdapter().typeId)){
  Hive.registerAdapter(subdataAdapter());
 }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    getAlldata();
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:bottombar(),
    );
  }
}