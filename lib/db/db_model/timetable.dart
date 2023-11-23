import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';

part 'timetable.g.dart';

@HiveType(typeId: 0)
class TimeTableData extends HiveObject {
  @HiveField(0)
  late String day;
  @HiveField(1)
  late List<String> timetable;
  TimeTableData(this.day,this.timetable);
}