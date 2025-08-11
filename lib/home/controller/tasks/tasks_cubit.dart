import 'package:flutter/material.dart';
import 'package:flutter_application_5/home/controller/tasks/tasks_states.dart';
import 'package:flutter_application_5/home/models/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:objectbox/objectbox.dart';

class TasksCubit extends Cubit<TasksStates> {
  late final Store _store;
  late final Box<TaskModel> _taskBox;

  TasksCubit(this._store) : super(TasksInitialState()) {
    _taskBox = _store.box<TaskModel>();
  }

  List<TaskModel> get tasks => _taskBox.getAll() ;

  TextEditingController taskName = TextEditingController();
  TextEditingController taskCatg = TextEditingController();

  void addTask() {
    _taskBox.put(TaskModel(title: taskName.text, cagt: taskCatg.text));
    taskName.clear();
    taskCatg.clear();
    emit(AddTaskState());
  }

  void deleteTask(TaskModel currentTask) {
    _taskBox.remove(currentTask.id);
    
    emit(DeleteTaskState(message: "deleted Successfully"));
  }
}


// task ==> title , catg , time 

// class >> model 





// create states
// create cubit
// create functions
// provide cubit
// trigle cubit
