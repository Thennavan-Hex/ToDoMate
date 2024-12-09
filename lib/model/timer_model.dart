import 'package:hive/hive.dart';

part 'timer_model.g.dart'; // To generate Hive adapter (auto-generated file)

@HiveType(typeId: 1)
class TimerModel extends HiveObject {
  @HiveField(0)
  final String taskName; // Name of the task or focus session

  @HiveField(1)
  final int timeLeftInSeconds; // Remaining time in seconds

  @HiveField(2)
  final DateTime created; // Time when the focus session was created

  @HiveField(3)
  final DateTime started; // Time when the focus session started

  @HiveField(4)
  bool endedEarly; // Flag to check if the session ended early

  TimerModel({
    required this.taskName,
    required this.timeLeftInSeconds,
    required this.created,
    required this.started,
    required this.endedEarly,
  });
}

