import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled1/model/timer_model.dart'; // Ensure that this import is correct

class DbDataScreen extends StatefulWidget {
  const DbDataScreen({super.key});

  @override
  _DbDataScreenState createState() => _DbDataScreenState();
}

class _DbDataScreenState extends State<DbDataScreen> {
  late Box<TimerModel> taskBox;

  @override
  void initState() {
    super.initState();
    // Open the 'TaskDB' box
    taskBox = Hive.box<TimerModel>('TimerDB');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Focus Sessions')),
      body: ValueListenableBuilder(
        valueListenable: taskBox.listenable(), // Listen for changes to the box
        builder: (context, Box<TimerModel> box, _) {
          if (box.isEmpty) {
            return const Center(
              child: Text('No saved focus sessions'),
            );
          }

          // Convert box values to a list of TimerModel
          final sessions = box.values.toList();

          return ListView.builder(
            itemCount: sessions.length,
            itemBuilder: (context, index) {
              final session = sessions[index];

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                elevation: 4,
                child: ListTile(
                  title: Text(session.taskName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Time Left: ${_formatTime(session.timeLeftInSeconds)}'),
                      Text('Created: ${_formatDateTime(session.created)}'),
                      Text('Started: ${_formatDateTime(session.started)}'),
                      Text('Ended Early: ${session.endedEarly ? 'Yes' : 'No'}'),
                    ],
                  ),
                  isThreeLine: true,
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Helper method to format seconds into minutes and seconds
  String _formatTime(int seconds) {
    final int minutes = (seconds / 60).floor();
    final int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  // Helper method to format DateTime to a readable format
  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';
  }
}
