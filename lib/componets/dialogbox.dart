// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:notes/componets/mybutton.dart';

class DialogBox extends StatelessWidget {

  
  DialogBox({
    super.key, 
    required this.controller,
    required this.onSave,
    required this.onCancle
    });

    
  final controller;
  VoidCallback onSave;
  VoidCallback onCancle;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
               fillColor: Color.fromARGB(255, 144, 224, 239)

              ),
            ),
            
            //save
            //cancle
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                MyButton(text: 'Save', callsthething:() {onSave();}),
                MyButton(text: 'Cancel', callsthething: (){onCancle();})
              ],
            ),

          ],
        ),
      ),
    );
  }
}