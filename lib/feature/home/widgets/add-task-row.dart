import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:todo2_application_1/core/widgets/custom_app_button.dart';
import 'package:todo2_application_1/feature/add%20task/add-task-screen.dart';

class Addtaskrow extends StatelessWidget {
  const Addtaskrow({super.key, required Future<Null> Function() onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              DateFormat.MMMEd().format(DateTime.now()).toString(),
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            )
          ],
        )),
        SizedBox(
          width: 150.w,
          child: CustomAppButton(
            title: "+ Add Task",
            onpressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => (AddTaskScreen())));
            }, onPressed: () {  },
          ),
        )
      ],
    );
  }
}
