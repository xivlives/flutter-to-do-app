import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskname;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;
   TodoTile({super.key, required this.taskname, required this.taskCompleted, required this.onChanged, required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top:25, right: 25, left: 25),
      child: Slidable(
        endActionPane:  ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              backgroundColor: const Color(0xFFFE4A49),
              icon: Icons.delete,
              borderRadius: const BorderRadius.horizontal(left: Radius.circular(0), right: Radius.circular(10)),
      )
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(24),
          
          decoration: const BoxDecoration(
            color: Colors.cyan, borderRadius: BorderRadius.horizontal(left: Radius.circular(10), right: Radius.circular(0))
            ),
          child: Row(
            children: [
              Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Colors.blueGrey[800],),
               Text(
                taskname, 
                style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w600, decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}