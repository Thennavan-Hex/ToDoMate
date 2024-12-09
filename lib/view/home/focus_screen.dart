import 'package:flutter/material.dart';
import 'package:untitled1/model/timer_function.dart';

class FocusScreen extends StatefulWidget {
  const FocusScreen({super.key});

  @override
  _FocusScreenState createState() => _FocusScreenState();
}

class _FocusScreenState extends State<FocusScreen> {
  int _secondsLeft = 0;
  bool _isSessionActive = false;

  // Function to handle time change
  void _updateTime(int seconds) {
    setState(() {
      _secondsLeft = seconds;
    });
  }

  // Function to handle session end
  void _endSession() {
    setState(() {
      _isSessionActive = false;
    });
    print('Timer ended');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Focus Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_secondsLeft == 0 && !_isSessionActive)
              const Text('Select focus time', style: TextStyle(fontSize: 20))
            else
              Text(
                _formatTime(_secondsLeft),
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            const SizedBox(height: 20),
            if (_isSessionActive)
              ElevatedButton(
                onPressed: () {
                  startFocusSession(
                    context,
                    _updateTime,
                    _endSession,
                  );
                },
                child: const Text('Start Focus'),
              ),
            if (_secondsLeft > 0)
              ElevatedButton(
                onPressed: () {
                  startFocusSession(
                    context,
                    _updateTime,
                    _endSession,
                  );
                },
                child: const Text('Stop & Reset'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          startFocusSession(
            context,
            _updateTime,
            _endSession,
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  // Helper method to format seconds into hours, minutes, and seconds
  String _formatTime(int seconds) {
    final int hours = (seconds / 3600).floor(); // Calculate hours
    final int minutes = ((seconds % 3600) / 60).floor(); // Calculate minutes
    final int remainingSeconds = seconds % 60; // Calculate remaining seconds

    // If hours are greater than 0, display in hh:mm:ss format
    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
    }
  }
}
