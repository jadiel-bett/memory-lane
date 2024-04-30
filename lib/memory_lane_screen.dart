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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          title: const Text(
            'Memory Lane',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
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
          backgroundColor: Colors.deepPurple,
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
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
