import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:todo2_application_1/core/app_contstants.dart';
import 'package:todo2_application_1/feature/home/models/task_model.dart';
import 'package:todo2_application_1/feature/home/widgets/task-item.dart';

class TasksListView extends StatefulWidget {
  const TasksListView({super.key});

  @override
  State<TasksListView> createState() => _TasksListViewState();
}

class _TasksListViewState extends State<TasksListView> {
  @override
  void initState() {
    allTasks = Hive.box<TaskModel>(AppContstants.taskbox).values.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return allTasks.isEmpty
        ? Lottie.asset("assets/empty.json")
        : Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                    width: double.infinity,
                    color: Colors.green,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "complete",
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                  ),
                  secondaryBackground: Container(
                    width: double.infinity,
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    child: Text(
                      "delete",
                      style: TextStyle(fontSize: 20.sp, color: Colors.white),
                    ),
                  ),
                  onDismissed: (Value) {
                    if (Value == DismissDirection.startToEnd) {
                      var task = Hive.box<TaskModel>(AppContstants.taskbox)
                          .getAt(index);
                      task?.statusText = "completed";
                      Hive.box<TaskModel>(AppContstants.taskbox)
                          .putAt(index, task!);
                          setState(() {
                                allTasks = Hive.box<TaskModel>(AppContstants.taskbox).values.toList();

                          });
                    } else {
                      Hive.box<TaskModel>(AppContstants.taskbox).deleteAt(index);
                          setState(() {
                                allTasks = Hive.box<TaskModel>(AppContstants.taskbox).values.toList();

                          });

                    }
                  },
                  key: UniqueKey(),
                  child: Taskitem(task: allTasks[index]),
                );
              },
              separatorBuilder: (context, index) => SizedBox(height: 10.h),
              itemCount: allTasks.length,
            ),
          );
  }
}
