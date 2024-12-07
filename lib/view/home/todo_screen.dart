import 'package:flutter/material.dart';
import 'package:untitled1/widget/add_button.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  void _onAddTodoPressed() {
    // ignore: avoid_print
    print('To-Do added');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do Screen'),
      ),
      body: const Center(
        child: Text('Manage your to-dos here'),
      ),
      floatingActionButton: AddButton(
        onPressed: _onAddTodoPressed,
        label: 'Add To-Do',
        icon: Icons.add,
      ),
    );
  }
}
