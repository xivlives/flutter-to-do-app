import 'package:flutter/material.dart';
import 'package:flutter_application_1/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSaved;
  DialogBox({super.key, required this.controller, required this.onSaved});

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: Colors.cyan[300],
      content: SizedBox(
        height: 170, 
        width: 280,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          //get user input
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                hintText: "new task",
                hintStyle: TextStyle(color: Colors.grey[500])
                ),
              ),  
          ),
          //buttons Save & Cancel
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            //save button
              MyButton(text: 'save', onPressed1: onSaved),
            //cancel button
            MyButton(text: 'cancel', onPressed1: (){Navigator.pop(context);})
            ],

          )
        ],),
      ),
    );
  }
}