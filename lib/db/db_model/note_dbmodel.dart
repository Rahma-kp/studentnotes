import 'package:hive/hive.dart';
part 'note_dbmodel.g.dart';

@HiveType(typeId: 2)
class notesData{
@HiveField(0)
 late final String note;
 @HiveField(1)
 late final List imagelists;
 @HiveField(2)
 late final List documentlist;
}