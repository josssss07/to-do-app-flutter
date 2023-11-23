// ignore_for_file: must_be_immutable, prefer_const_constructors, avoid_print, use_function_type_syntax_for_parameters

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes/componets/dialogbox.dart';
import 'package:notes/componets/todotile.dart';
import 'package:notes/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {
  
  //ref da box
  final myDbBox = Hive.box('myBox');
  ToDoDatabase db = ToDoDatabase();
  
  //controller variable
  final textController = TextEditingController();


  //check box
  void checkboxedChanged(bool value, int index ){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
      textController.clear();
    });
    db.updateDatabase();
  }

  //save task method
  void saveNewTask(){
    setState(() {
      db.toDoList.add([textController.text, false]);
      
    });
    Navigator.of(context, rootNavigator: true).pop();
    textController.clear();
    db.updateDatabase();
  }


  void cancelTask(){
    Navigator.of(context, rootNavigator: true).pop();
    textController.clear();
    db.updateDatabase();
  }

  //create task method
  void createNewTask(){
    showDialog(context: context, builder: (context){
      return DialogBox(
        controller: textController,
        onSave: saveNewTask,
        onCancle: cancelTask
      );
    });
    db.updateDatabase();
  }

  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }


  @override
  void initState() {
    if(myDbBox.get("TODOLIST") == null){
      db.createInitailData();
    }
    else{
      //data already exists
      db.loadData();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 144, 224, 239),
      appBar: AppBar(
        title: Text('To Do'),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 144, 224, 239),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){createNewTask();},
        child: Icon(Icons.add),
      ),
      
       body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index){
          return  ToDoTile(
            taskName: db.toDoList[index][0], 
            taskCompleted: db.toDoList[index][1], 
            onChanged: (value)=>checkboxedChanged(value!, index),
            deletefunction: (context )=>deleteTask(index),
          );
        },
      )
    );
  }
}