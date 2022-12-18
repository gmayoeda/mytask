import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _task = [
    Task(
      id: 'N1',
      title: 'Task 1 - UI',
      description:
          'In fields employing interface design skills, slicing is the process of dividing a single 2D user interface composition layout (comp) into multiple image files (digital assets) of the graphical user interface (GUI) for one or more electronic pages. It is typically part of the client side development process of creating a web page and/or web site, but is also used in the user interface design process of software development and game development.',
      updatedAt: DateTime.parse('2022-05-19 20:33:33'),
      createdAt: DateTime.parse('2022-05-19 20:33:33'),
    ),
    Task(
      id: 'N2',
      title: 'Task 2 - Basic',
      description:
          'Dart is a programming language designed for client development, such as for the web and mobile apps. It is developed by Google and can also be used to build server and desktop applications.',
      updatedAt: DateTime.parse('2021-05-20 20:53:33'),
      createdAt: DateTime.parse('2021-05-20 20:53:33'),
    ),
    Task(
      id: 'N3',
      title: 'Task 3 - Flutter',
      description:
          "Flutter's engine, written primarily in C++, provides low-level rendering support using either Google's Skia graphics library or the custom graphics layer. Additionally, it interfaces with platform-specific SDKs such as those provided by Android and iOS to implement accessibility, file and network I/O, native plugin support, and more.",
      updatedAt: DateTime.parse('2021-05-20 21:22:33'),
      createdAt: DateTime.parse('2021-05-20 21:22:33'),
    ),
    Task(
      id: 'N4',
      title: 'Task 4 - Database',
      description:
          'A database management system (DBMS) is the software that interacts with end users, applications, and the database itself to capture and analyze the data. The DBMS software additionally encompasses the core facilities provided to administer the database. The sum total of the database, the DBMS and the associated applications can be referred to as a database system. Often the term "database" is also used loosely to refer to any of the DBMS, the database system or an application associated with the database.',
      updatedAt: DateTime.parse('2021-05-20 21:51:33'),
      createdAt: DateTime.parse('2021-05-20 21:51:33'),
    ),
  ];

  List<Task> get task {
    List<Task> tempListTask = _task.where((task) => task.ispinned).toList();
    tempListTask.addAll(_task.where((task) => !task.ispinned).toList());

    return tempListTask;
  }

  bool _isSwitched = false;
  bool get isSwitched => _isSwitched;
  set isSwitched(bool value) {
    _isSwitched = value;
    notifyListeners();
  }

  void toggleIsPinned(String id) {
    int index = _task.indexWhere((task) => task.id == id);
    if (index >= 0) {
      _task[index].ispinned = !_task[index].ispinned;
      notifyListeners();
    }
  }

  void addTask(Task task) {
    _task.add(task);
    notifyListeners();
  }

  Task getTask(String id) {
    return _task.firstWhere((task) => task.id == id);
  }

  void updateIsCompleted(String id) {
    int index = _task.indexWhere((task) => task.id == id);
    if (index >= 0) {
      _task[index].iscompleted = true;
      notifyListeners();
    }
  }

  void deleteTask(String id) {
    _task.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  int countIsCompleted() {
    if (task.isEmpty) {
      return 0;
    }
    var foundElements = task.where((task) => task.iscompleted == true);
    return foundElements.length;
  }
}
