import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/task_provider.dart';
import '../../utils/custom_widget.dart';
import '../../utils/dynamic_field.dart';
import '../../models/task.dart';

class TaskDetails extends StatefulWidget {
  final String id;
  const TaskDetails({super.key, required this.id});

  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  bool init = true;

  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  @override
  void didChangeDependencies() {
    if (init) {
      final taskX = Provider.of<TaskProvider>(context, listen: false);
      Task task = taskX.getTask(widget.id);

      title.text = task.title;
      desc.text = task.description;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final taskX = Provider.of<TaskProvider>(context, listen: false);
    Task task = taskX.getTask(widget.id);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Detail Task"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('Created at : ${CustomWidgets.formatDate(task.createdAt)}'),
              Text('Updated at : ${CustomWidgets.formatDate(task.updatedAt)}'),
              FieldDynamics(
                  controller: title,
                  readonly: true,
                  label: 'Title',
                  type: TextInputType.text,
                  needValidate: true),
              FieldDynamics(
                  controller: desc,
                  readonly: true,
                  label: 'Description of Task',
                  minLines: 7,
                  type: TextInputType.text,
                  needValidate: true),
              const SizedBox(
                height: 30.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: ButtonPrimary(
                      title: 'Delete',
                      color: Colors.orange,
                      action: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Delete this task ?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    taskX.deleteTask(widget.id);
                                    Navigator.pop(context);
                                    CustomWidgets.displaySnackBar(context,
                                        message:
                                            '${task.title}  |  Delete your task successfully.',
                                        warning: false);
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Delete',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'No',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                      ),
                    ),
                  ),
                  task.iscompleted
                      ? const SizedBox()
                      : Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: ButtonPrimary(
                              title: 'Completed',
                              color: Colors.green,
                              action: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Task is Completed ?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            taskX.updateIsCompleted(widget.id);
                                            Navigator.pop(context);
                                            CustomWidgets.displaySnackBar(
                                                context,
                                                message:
                                                    '${task.title}  |  Your task is complete.',
                                                warning: false);
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'Completed',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text(
                                            'No',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              icon: const Icon(
                                Icons.check_box,
                              ),
                            ),
                          ),
                        )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
