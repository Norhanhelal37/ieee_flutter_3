import 'package:flutter/material.dart';
import 'package:flutter_application_5/home/controller/tasks/tasks_cubit.dart';
import 'package:flutter_application_5/home/controller/tasks/tasks_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Tasks",style: Theme.of(context).textTheme.displayLarge!.copyWith( color: Colors.black)   ,),
      ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      "Add new Task",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    content: TextField(
                      controller: context.read<TasksCubit>().newTask,
                      onChanged: (value) {
                        print(value);
                      },
                      decoration:
                          InputDecoration(border: UnderlineInputBorder()),
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            context.read<TasksCubit>().addTask();

                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Add ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
                  );
                },
              );
            },
            backgroundColor: Colors.purple,
            child: Icon(
              Icons.add,
              size: 25,
              color: Colors.red,
            )),
        backgroundColor: Colors.white,
        body:
            // bloc builder
            // bloc listener
            // bloc consumer
            
            BlocConsumer<TasksCubit,TasksStates>(
              listener: (context, state) {
                if(state is AddTaskState){
                   ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.greenAccent,
                        duration: Duration(milliseconds: 10),
                        
                        content: Text("Task Added !"))
                    );
                }
                if(state is DeleteTaskState){
                   ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.redAccent,
                        
                        content: Text(state.message))
                    );
                }
                
                
              },
              builder: (context, state) => 
               ListView.builder(
                itemCount: context.read<TasksCubit>().tasks.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: 500,
                    margin: EdgeInsets.all(20),
                    color: Colors.blue,
                    child: Row(
                      children: [
                        Text(context.read<TasksCubit>().tasks[index]),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              context.read<TasksCubit>().deleteTask(
                                  context.read<TasksCubit>().tasks[index]);
                            },
                            icon: Icon(Icons.remove))
                      ],
                    ),
                  );
                },
              ),
            ));
  }
}
