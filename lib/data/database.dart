import 'package:hive_flutter/adapters.dart';

class ToDoDatabase{

  List toDoList= [];
  //ref box
  final _myBox = Hive.box('myBox');

  //run this method if this is the first time ever opening this app
  void createInitailData(){
    toDoList = [
      ['Swipe right to Delete Task', false],
      ['Drink water', false],
      ['Complete Homework', false]
    ];
  }
  //to load data from database
  void loadData(){
    toDoList = _myBox.get("TODOLIST");
  }

  //update databse
  void updateDatabase(){
    _myBox.put("TODOLIST", toDoList);
  }
}