import 'package:flutter/material.dart';

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

class Memory {
  String imageUrl;
  String description;

  Memory({required this.imageUrl, required this.description});
}

class MemoryListItem extends StatelessWidget {
  final Memory memory;
  final VoidCallback onDelete;

  const MemoryListItem(
      {super.key, required this.memory, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(memory.imageUrl),
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
    );
  }
}

class MemoryDetailScreen extends StatelessWidget {
  final Memory memory;

  const MemoryDetailScreen({super.key, required this.memory});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Memory Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.network(
              memory.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              memory.description,
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
    );
  }
}

class AddMemoryScreen extends StatefulWidget {
  const AddMemoryScreen({super.key});

  @override
  _AddMemoryScreenState createState() => _AddMemoryScreenState();
}

class _AddMemoryScreenState extends State<AddMemoryScreen> {
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
