import 'package:flutter/material.dart';

class Taskmodel {
  String title;
  String startitem;
  String enditem;
  String descreption;
  String statustext;
  Color color;

  Taskmodel(
      {required this.title,
      required this.startitem,
      required this.enditem,
      required this.descreption,
      required this.statustext,
      required this.color});
}
List<Taskmodel> alltasks=[

        Taskmodel(title: 'task 1', startitem: '02:23 PM', enditem: '02:45 PM', descreption: 'i will do this task', statustext: 'ToDo', color:Colors.indigo ),

        Taskmodel(title: 'task 2', startitem: '02:23 PM', enditem: '02:45 PM', descreption: 'i will do this task', statustext: 'ToDo', color:Colors.green ),
      
        Taskmodel(title: 'task 3', startitem: '02:23 PM', enditem: '02:45 PM', descreption: 'i will do this task', statustext: 'ToDo', color:const Color.fromARGB(255, 245, 95, 237) ),



];
