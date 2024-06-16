import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:flutter_application_1/util/dialog_box.dart';
import 'package:flutter_application_1/util/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  //reference the box
  final _myBox = Hive.box('mybox');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    //if this is the first time opening the app
    //that is by checking if the todolist in the database is empty/null
    if(_myBox.get("TODOLIST") == null){
      db.createInitialData();
    }else{
      //data already exists 
      db.loadData();
    }
    // implement init state 
    super.initState();
  }

  //text controller
  final _controller = TextEditingController();

  //list of todo tasks
  // List todoList = [
  //   ["take a nap", false],
  //   ["do exercise", false],
  //   ["take a nap", false]
  // ];

  //checkbox was tapped
  void checkedBoxChanged(bool? value, int index){
    setState(() {
      db.todoList[index][1] = !db.todoList[index][1];
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: const Text("TO-DO", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context, 
            builder:(context){
              return DialogBox(
                controller: _controller,
                onSaved: () {
                  setState(() {
                    db.todoList.add([_controller.text, false]);
                    _controller.clear;
                    Navigator.pop(context);
                    db.updateDatabase();
                  });
                },
              );
            } 
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.todoList.length,
        itemBuilder: (context, index){
          return TodoTile(
            taskname: db.todoList[index][0], 
            taskCompleted: db.todoList[index][1], 
            onChanged: (value) => checkedBoxChanged(value, index),
            deleteFunction: (p0) {
              setState(() {
                db.todoList.removeAt(index);
              });
              db.updateDatabase();
            },
            );
        },
      ),
    );
  }
}