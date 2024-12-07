import 'package:flutter/material.dart';
import 'package:untitled1/widget/add_button.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  void _onAddTaskPressed() {
    // ignore: avoid_print
    print('Task added');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Screen'),
      ),
      body: const Center(
        child: Text('Manage your tasks here'),
      ),
      floatingActionButton: AddButton(
        onPressed: _onAddTaskPressed,
        label: 'Add Task',
        icon: Icons.add,
      ),
    );
  }
}
