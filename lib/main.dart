import 'package:flutter/material.dart';
import 'package:mytask/moduls/home/home.dart';
import 'package:provider/provider.dart';

import 'providers/task_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        title: 'MyTask-On',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        // ThemeData(
        //     primarySwatch: Colors.amber,
        //     scaffoldBackgroundColor: Colors.grey[200]),
        home: const MyHome(),
      ),
    );
  }
}
