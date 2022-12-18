import 'package:flutter/material.dart';
import 'package:mytask/moduls/add%20task/task_add.dart';
import 'package:provider/provider.dart';
import '../../providers/task_provider.dart';
import 'task_grid.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    final taskX = Provider.of<TaskProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My List Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  Icons.developer_board,
                  size: 24.0,
                ),
                SizedBox(width: 10),
                Text(
                  "Hello, Gema",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Expanded(
              child: TaskGrid(),
            ),
          ],
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<TaskProvider>(
              builder: (context, value, child) => Text(
                "${taskX.countIsCompleted()} tasks completed out of ${taskX.task.length} tasks.",
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (builder) => const AddTask(),
          ));
        },
        child: const Icon(
          Icons.add_box,
          size: 30,
          color: Colors.white,
        ),
      ),
    );
  }
}
