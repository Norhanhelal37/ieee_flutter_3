import 'package:flutter/material.dart';
import 'package:flutter_application_5/home/controller/tasks/tasks_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksCubit extends Cubit<TasksStates> {
  TasksCubit() : super(TasksInitialState());

  List<String> tasks = [];

  TextEditingController newTask = TextEditingController();

  void addTask() {
    tasks.add(newTask.text);
    newTask.clear();
    emit(AddTaskState());
  }

  void deleteTask(String currentTask) {
    tasks.remove(currentTask);
    emit(DeleteTaskState(message: "deleted Successfully"));
  }
}

// create states
// create cubit
// create functions
// provide cubit
// trigle cubit
