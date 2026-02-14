import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:todo2_application_1/core/app_contstants.dart';
import 'package:todo2_application_1/feature/add%20task/add-task-screen.dart';
import 'package:todo2_application_1/feature/auth/models/user_model.dart';
import 'package:todo2_application_1/feature/home/models/task-model.dart';
import 'package:todo2_application_1/feature/home/widgets/add-task-row.dart';
import 'package:todo2_application_1/feature/home/widgets/home-app-bar.dart';
import 'package:todo2_application_1/feature/home/widgets/task-item.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    var userdata = Hive.box<UserModel>(AppContstants.userbox).getAt(0);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            if (userdata != null)
              HomeAppBar(
                userData: userdata,
              ),
            SizedBox(
              height: 20.h,
            ),
            Addtaskrow(onPressed: () async {
              await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddTaskScreen()));
              
            }),
            SizedBox(
              height: 20.h,
            ),
            allTasks.isEmpty
                ? Lottie.asset("assets/empty.json")
                : Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Dismissible(
                            background: Icon(Icons.delete),
                            secondaryBackground: Icon(Icons.add_a_photo),
                            key: UniqueKey(),
                            child: Taskitem(
                              task: allTasks[index],
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                        itemCount: allTasks.length),
                  ),
          ],
        ),
      )),
    );
  }
}
