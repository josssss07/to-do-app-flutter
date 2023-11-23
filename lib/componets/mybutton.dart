// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  VoidCallback callsthething;
  MyButton(
    {super.key, 
    required this.text, 
    required this.callsthething  
    });
  
  @override 
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: callsthething,
      //color: Theme.of(context).primaryColor,
      child: Text(text),
    ); 
  }
}

/*
Container(
      const BoxDecoration(
        borderRadius: BorderRadius.all(20 as Radius),
      ),
      child: MaterialButton(
        onPressed: () {  },
        color: Theme.of(context).primaryColor,
        child: Text(text),
      ),
    );


Row(
      children: <Widget>[
        Container(
          //borderRadius: BorderRadius.all(2 as Radius),
        )
      ],
    );
    */