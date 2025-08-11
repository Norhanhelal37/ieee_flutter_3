
import 'package:objectbox/objectbox.dart';

@Entity()
class TaskModel {
  int id;
  final String title;

  final String cagt;

  TaskModel({this.id = 0,required this.title, required this.cagt});
}

// sql 
// hive ---> no sql 
// knn 