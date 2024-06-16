import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase{
  List todoList = [];
  //reference my box
  final _box = Hive.box('mybox');

  //run this method if its the first opening the app
  void createInitialData(){
    todoList = [
      ['Do excercise', false],
      ['make tutorial', false]
    ];
  }

  //load the data
  void loadData(){
    todoList = _box.get("TODOLIST");
  }

  //update the database
  void updateDatabase(){
     _box.put("TODOLIST", todoList);
  }
}