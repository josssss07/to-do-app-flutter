// ignore_for_file: camel_case_types, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/pages/homepage.dart';

void main()async{
  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox('mybox');

  runApp(const myApp(),);
}


class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 202, 240 ,248),
        useMaterial3: true,
      ),
      
    );
  }
}