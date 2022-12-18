import 'package:flutter/material.dart';
import 'package:mytask/moduls/home/task_item.dart';
import 'package:mytask/providers/task_provider.dart';
import 'package:provider/provider.dart';

import '../../models/task.dart';

class TaskGrid extends StatefulWidget {
  const TaskGrid({super.key});

  @override
  State<TaskGrid> createState() => _TaskGridState();
}

class _TaskGridState extends State<TaskGrid> {
  @override
  Widget build(BuildContext context) {
    final taskX = Provider.of<TaskProvider>(context);
    List<Task> listTask = taskX.task;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
      itemCount: listTask.length,
      itemBuilder: (BuildContext context, int i) {
        return TaskItem(id: listTask[i].id);
      },
    );
  }
}
