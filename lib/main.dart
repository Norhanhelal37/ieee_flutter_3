import 'package:flutter/material.dart';
import 'package:flutter_application_5/home/controller/tasks/tasks_cubit.dart';
import 'package:flutter_application_5/home/controller/themes/theme_cubit.dart';
import 'package:flutter_application_5/home/screens/home_screen.dart';
import 'package:flutter_application_5/objectbox.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

late final Store store;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  store =await openStore();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});








  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => TasksCubit( store)),
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, bool>(
        builder: (context, isDark) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              appBarTheme:
                  const AppBarTheme(centerTitle: true, color: Colors.green),
              textTheme: const TextTheme(
                displayLarge: TextStyle(
                    fontSize: 17,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold),
                displaySmall: TextStyle(
                    fontSize: 12,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
            ),
            theme: ThemeData(
              appBarTheme: const AppBarTheme(
                backgroundColor: Colors.deepOrange,
                centerTitle: true,
                foregroundColor: Colors.yellow,
              ),
              elevatedButtonTheme:
                  ElevatedButtonThemeData(style: ElevatedButton.styleFrom()),
              buttonTheme: ButtonThemeData(
                colorScheme:
                    ColorScheme.fromSeed(seedColor: Colors.lightBlueAccent),
              ),
              textTheme: const TextTheme(
                displayLarge: TextStyle(
                    fontSize: 17,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold),
                displaySmall: TextStyle(
                    fontSize: 12,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
              colorScheme: ColorScheme.fromSeed(
                brightness: Brightness.light,
                onPrimary: Colors.blue,
                seedColor: Colors.red,
              ),
              useMaterial3: true,
            ),
            home: const HomeScreen(),
          );
        },
      ),
    );
  }
}
