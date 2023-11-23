// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile(
    {super.key, 
    required this.taskName, 
    required this.taskCompleted,
    required this.onChanged,
    required this.deletefunction
    });

  final String taskName; 
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletefunction;
  
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.only(left:20.0, right: 20, top: 20),
      child: Slidable(
        endActionPane: ActionPane(
          motion:StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deletefunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(20),
              )
          ] ,
        ),
        child: Container(
          padding: EdgeInsets.all(26),
          child: Row(
            children: [
              //task
              Text(
                taskName,
                style: TextStyle(
                  //decoration: TextDecoration(decoration: taskCompleted? TextDecoration.lineThrough),
                  decoration: taskCompleted
                  ?TextDecoration.lineThrough:
                  TextDecoration.none,
                  
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),),
              Spacer(),
              //checkbox
              Checkbox(
                value: taskCompleted, 
                onChanged: onChanged,
                activeColor: Colors.black,
                )
        
          ]),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 202, 240 ,248),
            borderRadius: BorderRadius.circular(20)
          ),
          ),
      ),
      );
  }
}