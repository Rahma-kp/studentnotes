
import 'package:hive/hive.dart';
part 'data_model.g.dart';



@HiveType(typeId: 1)
class subdata{
  @HiveField(0)
  int? id;
  @HiveField(1)
  late final String subtitle;
  @HiveField(2)
  late final String subabout;
  subdata({required this.subtitle,required this.subabout,this.id});

}