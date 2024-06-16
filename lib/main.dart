import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/todo_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  //init hive
  await Hive.initFlutter();
  //open a box
  var box = await Hive.openBox('mybox');
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TodoPage(),
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
      
    );
  }
}
