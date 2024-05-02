import 'package:flutter/material.dart';
import 'package:memory_lane/memory_lane_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MemoryLaneApp());
}

class MemoryLaneApp extends StatelessWidget {
  const MemoryLaneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Lane',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MemoryLaneScreen(),
    );
  }
}
