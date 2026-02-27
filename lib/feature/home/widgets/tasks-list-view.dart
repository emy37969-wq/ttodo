

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:todo2_application_1/feature/home/models/task-model.dart';
import 'package:todo2_application_1/feature/home/widgets/task-item.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return allTasks.isEmpty
        ? Lottie.asset("assets/empty.json")
        : Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Dismissible(
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