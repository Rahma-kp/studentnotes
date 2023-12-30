
import 'package:hive/hive.dart';
import 'package:studentnot/model/todo_model.dart';

class TodoService {
 Future<List<SubData>> getAllData()async{
     final sudb = await Hive.openBox<SubData>('subdata_db');
     return sudb.values.toList();
   }
   Future<void> AddTodo(SubData value)async{
   final subdb = await Hive.openBox<SubData>('subdata_db');
   await subdb.add( value);
   }
    Future<void> deleteTodo(int index) async {
  final subdb = await Hive.openBox<SubData>('subdata_db');
  subdb.deleteAt(index);
}

}
