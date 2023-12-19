import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list/providers/task_provider.dart';
import 'package:task_list/pages/task_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Task List App',
        theme: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(color: Colors.white),
              labelStyle: TextStyle(color: Colors.white),
            ),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Color(0xffFF4181)),
            scaffoldBackgroundColor: Colors.black,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
                titleTextStyle: TextStyle(color: Colors.white, fontSize: 22),
                backgroundColor: Color(0xFF2D2D2D))),
        home: TaskListScreen(),
      ),
    );
  }
}
