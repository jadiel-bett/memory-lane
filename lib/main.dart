import 'package:flutter/material.dart';
import 'package:memory_lane/memory_lane_screen.dart';

void main() {
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
