import 'package:flutter/material.dart';
import 'screens/task_list.dart';
import 'screens/task_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: false,
      ),
      initialRoute: '/',
      routes: {'/': (context) => const TaskListScreen()},
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          return MaterialPageRoute(
            builder: (_) => const TaskDetailScreen(),
            settings: settings,
          );
        }
        return null;
      },
    );
  }
}
