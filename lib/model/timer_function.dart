import 'dart:async';
import 'package:flutter/material.dart';

/// Function to start the focus session timer
void startFocusSession(
    BuildContext context, ValueChanged<int> onTimeChanged, Function onEndSession) {
  Timer? _timer;
  int _secondsLeft = 0;

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft > 0) {
        onTimeChanged(_secondsLeft);
        _secondsLeft--;
      } else {
        _timer?.cancel();
        onEndSession();
      }
    });
  }

  Future<void> _onAddFocusPressed() async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      DateTime now = DateTime.now();
      DateTime selectedDateTime = DateTime(now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);

      Duration timeDifference = selectedDateTime.isBefore(now)
          ? selectedDateTime.add(const Duration(days: 1)).difference(now)
          : selectedDateTime.difference(now);

      _secondsLeft = timeDifference.inSeconds;
      _startTimer();
    }
  }

  // This function will be used to stop the timer
  void stopTimer() {
    _timer?.cancel();
    _secondsLeft = 0;
    onTimeChanged(_secondsLeft);
  }

  // Start the focus session timer on button press
  _onAddFocusPressed();
}
