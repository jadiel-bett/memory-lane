import 'package:flutter/material.dart';
import 'package:memory_lane/memory.dart';

class AddMemoryScreen extends StatefulWidget {
  const AddMemoryScreen({super.key});

  @override
  AddMemoryScreenState createState() => AddMemoryScreenState();
}

class AddMemoryScreenState extends State<AddMemoryScreen> {
  late String imageUrl;
  late String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Memory'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Image URL'),
              onChanged: (value) {
                imageUrl = value;
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(labelText: 'Description'),
              onChanged: (value) {
                description = value;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (imageUrl.isNotEmpty && description.isNotEmpty) {
                  Navigator.pop(
                    context,
                    Memory(imageUrl: imageUrl, description: description),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Please fill in all fields.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Add Memory'),
            ),
          ],
        ),
      ),
    );
  }
}
