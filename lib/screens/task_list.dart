import 'package:flutter/material.dart';
import '../data/tasks.dart';
import '../widgets/task_card.dart';
import '../models/task.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 8),
          itemCount: demoTasks.length,
          itemBuilder: (context, index) {
            final Task t = demoTasks[index];
            return TaskCard(
              task: t,
              onTap: () {
                Navigator.pushNamed(context, '/detail', arguments: t);
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Not implemented (hardcoded data requirement)
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Add not implemented (hardcoded demo)'),
            ),
          );
        },
      ),
    );
  }
}
