import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:untitled1/core/constants/theme.dart';
import 'package:untitled1/core/constants/bottom_nav.dart';
import 'package:untitled1/db_data_screen.dart';
import 'package:untitled1/model/timer_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(TimerModelAdapter());

  await Hive.openBox('TaskDB');
  await Hive.openBox<TimerModel>('TimerDB');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme, 
      themeMode: ThemeMode.system,
      home: const BottomNav(),
    );
  }
}
