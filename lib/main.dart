import 'package:flutter/material.dart';
import 'package:flutter_application_5/home/controller/tasks/tasks_cubit.dart';
import 'package:flutter_application_5/home/screens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => TasksCubit() ,
      child: 
        MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: HomeScreen(),
        )
      
    );
  }
}
