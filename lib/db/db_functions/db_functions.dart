import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:studentnot/db/db_model/data_model.dart';

ValueNotifier<List<subdata>>SubListNotifier= ValueNotifier([]);

Future<void> addSub(subdata value) async{

  final subDB= await Hive.openBox<subdata>("subdata_db");
  await subDB.add(value);
  SubListNotifier.value.add(value);
  SubListNotifier.notifyListeners();
}
Future<void> getAlldata()async{
  final subDB= await Hive.openBox<subdata>("subdata_db");
  SubListNotifier.value.clear();
  SubListNotifier.value.addAll(subDB.values);
  SubListNotifier.notifyListeners();
}