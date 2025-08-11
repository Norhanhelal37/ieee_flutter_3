import 'package:flutter/material.dart';
import 'package:flutter_application_5/home/controller/tasks/tasks_cubit.dart';
import 'package:flutter_application_5/home/controller/tasks/tasks_states.dart';
import 'package:flutter_application_5/home/controller/themes/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            BlocBuilder<ThemeCubit,bool>(
              builder: (context,state) {
                return IconButton(
                    onPressed: () {
                      context
                          .read<ThemeCubit>()
                          .toggleMode(!state);
                
                      print(state);
                    },
                    icon: state
                        ? Icon(Icons.dark_mode)
                        : Icon(Icons.light_mode));
              }
            )
          ],
          title: Text(
            "My Tasks",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: Colors.black),
          ),
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
                          // use theme
                          Theme.of(context)
                              .textTheme
                              .displaySmall!
                              .copyWith(color: Colors.blue),
                    ),
                    content: Column(
                      children: [
                        TextField(
                          
                          controller: context.read<TasksCubit>().taskName,
                          onChanged: (value) {
                            print(value);
                          },
                          decoration:
                              InputDecoration(
                                hintText: "task",
                                border: UnderlineInputBorder()),
                        ),

                        TextField(
                          controller: context.read<TasksCubit>().taskCatg,
                          onChanged: (value) {
                            print(value);
                          },
                          decoration:
                              InputDecoration(
                                hintText: "task category",
                                border: UnderlineInputBorder()),
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            context.read<TasksCubit>().addTask(
                              
                            );

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
              color: Theme.of(context).colorScheme.onPrimary,
            )),
        backgroundColor: Colors.white,
        body:
            // bloc builder
            // bloc listener
            // bloc consumer

            BlocConsumer<TasksCubit, TasksStates>(
          listener: (context, state) {
            if (state is AddTaskState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.greenAccent,
                  duration: Duration(milliseconds: 10),
                  content: Text("Task Added !")));
            }
            if (state is DeleteTaskState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.redAccent,
                  content: Text(state.message)));
            }
          },
          builder: (context, state) => ListView.builder(
            itemCount: context.read<TasksCubit>().tasks.length,
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                width: 500,
                margin: EdgeInsets.all(20),
                color: Colors.blue,
                child: Row(
                  children: [
                    Text(context.read<TasksCubit>().tasks[index].title),
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
