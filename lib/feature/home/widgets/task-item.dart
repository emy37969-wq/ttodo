import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo2_application_1/feature/home/models/task-model.dart';

class Taskitem extends StatelessWidget {
  final Taskmodel task;

  const Taskitem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r), color: task.color),
      child: Row(
        children: [
          Expanded(
              child: Column(
            spacing: 10.h,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                "${task.startitem}  | ${task.enditem}",
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
              Text(
                task.descreption,
                style: TextStyle(fontSize: 18.sp, color: Colors.white),
              ),
            ],
          )),
          Container(
            color: Colors.grey,
            width: 2.w,
            height: 100.h,
          ),
          SizedBox(
            width: 10.w,
          ),
          RotatedBox(
              quarterTurns: 3,
              child: Text(
                task.statustext,
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )),
        ],
      ),
    );
  }
}
