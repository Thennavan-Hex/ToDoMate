import 'package:flutter/material.dart';
import 'package:untitled1/widget/add_button.dart';

class FocusScreen extends StatelessWidget {
  const FocusScreen({super.key});

  void _onAddFocusPressed() {
    // ignore: avoid_print
    print('Focus session started');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Focus Screen'),
      ),
      body: const Center(
        child: Text('Focus on your work here'),
      ),
      floatingActionButton: AddButton(
        onPressed: _onAddFocusPressed,
        label: 'Start Focus',
        icon: Icons.add,
      ),
    );
  }
}
