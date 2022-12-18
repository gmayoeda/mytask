import 'package:flutter/material.dart';
import 'package:mytask/moduls/detail%20task/task_detail.dart';
import 'package:provider/provider.dart';

import '../../models/task.dart';
import '../../providers/task_provider.dart';
import '../../utils/iconpin_icons.dart';

class TaskItem extends StatefulWidget {
  final String id;
  const TaskItem({super.key, required this.id});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    final taskX = Provider.of<TaskProvider>(context, listen: false);
    Task task = taskX.getTask(widget.id);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (builder) => TaskDetails(id: task.id),
          ));
        },
        child: GridTile(
          header: Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(task.ispinned ? Iconpin.pin : Iconpin.pinOutline),
                onPressed: () {
                  taskX.toggleIsPinned(widget.id);
                },
              )),
          footer: GridTileBar(
              backgroundColor: Colors.black.withOpacity(0.7),
              title: Text(task.title),
              trailing: task.iscompleted
                  ? const Icon(
                      Icons.check_box,
                      color: Colors.green,
                    )
                  : const SizedBox()),
          child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[700]),
              child: Text(task.description)),
        ),
      ),
    );
  }
}
