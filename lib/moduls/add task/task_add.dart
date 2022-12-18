import 'package:flutter/material.dart';
import 'package:mytask/utils/custom_widget.dart';
import 'package:mytask/utils/dynamic_field.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../../models/task.dart';
import '../../providers/task_provider.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _formKey = GlobalKey<FormState>();

  String rand = math.Random().nextInt(100).toString();

  TextEditingController title = TextEditingController();
  TextEditingController desc = TextEditingController();

  // ignore: prefer_final_fields

  void doSubmitList() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Task task = Task(
        id: rand,
        title: title.text,
        description: desc.text,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final taskX = Provider.of<TaskProvider>(context, listen: false);
      taskX.addTask(task);
      CustomWidgets.displaySnackBar(context,
          message: 'Submit your task successfully.', warning: false);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add New Task'),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  FieldDynamics(
                      controller: title,
                      label: 'Title',
                      type: TextInputType.text,
                      needValidate: true),
                  FieldDynamics(
                      controller: desc,
                      label: 'Description of Task',
                      minLines: 7,
                      type: TextInputType.text,
                      needValidate: true),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ButtonPrimary(
                    title: 'Submit',
                    color: Colors.amber,
                    action: () {
                      doSubmitList();
                    },
                    icon: const Icon(
                      Icons.add_reaction,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
