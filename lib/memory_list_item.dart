import 'package:flutter/material.dart';
import 'package:memory_lane/memory.dart';
import 'package:memory_lane/memory_detail_screen.dart';

class MemoryListItem extends StatelessWidget {
  final Memory memory;
  final VoidCallback onDelete;

  const MemoryListItem(
      {super.key, required this.memory, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: memory.image != null
              ? FileImage(memory.image!)
              : const AssetImage('assets/placeholder.png') as ImageProvider,
        ),
        title: Text(memory.description),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MemoryDetailScreen(memory: memory),
            ),
          );
        },
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
