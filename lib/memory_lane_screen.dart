import 'package:flutter/material.dart';
import 'package:memory_lane/add_memory_screen.dart';
import 'package:memory_lane/memory.dart';
import 'package:memory_lane/memory_list_item.dart';

class MemoryLaneScreen extends StatefulWidget {
  const MemoryLaneScreen({super.key});

  @override
  MemoryLaneScreenState createState() => MemoryLaneScreenState();
}

class MemoryLaneScreenState extends State<MemoryLaneScreen> {
  List<Memory> memories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory Lane'),
      ),
      body: ListView.builder(
        itemCount: memories.length,
        itemBuilder: (BuildContext context, int index) {
          return MemoryListItem(
            memory: memories[index],
            onDelete: () {
              setState(() {
                memories.removeAt(index);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMemoryScreen()),
          ).then((newMemory) {
            if (newMemory != null) {
              setState(() {
                memories.add(newMemory);
              });
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
