abstract class TasksStates {}

class TasksInitialState extends TasksStates {}

class DeleteTaskState extends TasksStates {
  final String message;

  DeleteTaskState({required this.message});
}

class AddTaskState extends TasksStates {}
