
import 'package:hive/hive.dart';
part 'note_model.g.dart';

@HiveType(typeId: 2)
class NotesData{
@HiveField(0)
late final String? notetitle;
@HiveField(1)
late final String? note;
@HiveField(2)
late final List? imagelists;
@HiveField(3)
late final List? documentlist;
@HiveField(4)
late final String? category;

 NotesData({required this.notetitle,required this.note,this.imagelists,this.documentlist,required this.category});
}