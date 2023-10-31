import 'package:flutter/material.dart';
import 'package:studentnot/db/db_model/data_model.dart';

ValueNotifier<List<subdata>>SubListNotifier= ValueNotifier([]);

void addSub(subdata value){
  SubListNotifier.value.add(value);
  print(value.toString());
}