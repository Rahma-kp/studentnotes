
import 'package:hive/hive.dart';
part 'todo_model.g.dart';



@HiveType(typeId: 1)
class SubData{
  @HiveField(0)
  int? id;
  @HiveField(1)
  late final String subtitle;
  @HiveField(2)
  late final String subabout;
  SubData({required this.subtitle,required this.subabout,this.id});

}
 