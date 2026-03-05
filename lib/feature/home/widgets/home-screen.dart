// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:todo2_application_1/core/app_contstants.dart';
// import 'package:todo2_application_1/feature/add%20task/add-task-screen.dart';
// import 'package:todo2_application_1/feature/auth/models/user_model.dart';
// import 'package:todo2_application_1/feature/home/widgets/add-task-row.dart';
// import 'package:todo2_application_1/feature/home/widgets/home-app-bar.dart';
// import 'package:todo2_application_1/feature/home/widgets/tasks-list-view.dart';

// class Homescreen extends StatefulWidget {
//   const Homescreen({super.key});

//   @override
//   State<Homescreen> createState() => _HomescreenState();
// }

// class _HomescreenState extends State<Homescreen> {
//   @override
//   Widget build(BuildContext context) {
//     var userdata = Hive.box<UserModel>(AppContstants.userbox).getAt(0);
//     return Scaffold(
//       body: SafeArea(
//           child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 16.w),
//         child: Column(
//           children: [
//             if (userdata != null)
//               HomeAppBar(
//                 userData: userdata,
//               ),
//             SizedBox(
//               height: 20.h,
//             ),
//             Addtaskrow(onPressed: () async {
//               await Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => AddTaskScreen()),
//                   );
//                   setState(() {});
//             }),
//             SizedBox(
//               height: 20.h,
//             ),
//             TasksListView(),
//           ],
//         ),
//       )),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:todo2_application_1/core/app_contstants.dart';
import 'package:todo2_application_1/feature/add%20task/add-task-screen.dart';
import 'package:todo2_application_1/feature/auth/models/user_model.dart';
import 'package:todo2_application_1/feature/home/models/task_model.dart';
import 'package:todo2_application_1/feature/home/widgets/add-task-row.dart';
import 'package:todo2_application_1/feature/home/widgets/home-app-bar.dart';
import 'package:todo2_application_1/feature/home/widgets/tasks-list-view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int activeindex = 0;
  @override
  Widget build(BuildContext context) {
    var box = Hive.box<UserModel>(AppContstants.userbox);
    int totalUsers = box.length;

    var userData = Hive.box<UserModel>(
      AppContstants.userbox,
    ).getAt(totalUsers - 1);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              HomeAppBar(userData: userData),
              SizedBox(height: 20.h),
              Addtaskrow(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => AddTaskScreen()),
                  );
                  setState(() {});
                },
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Expanded(
                      child: FilterButton(
                    title: "All",
                    isactive: activeindex == 0,
                    onTap: () {
                      setState(() {
                        allTasks = Hive.box<TaskModel>(AppContstants.taskbox)
                            .values
                            .toList();
                        activeindex = 0;
                      });
                    },
                  )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                      child: FilterButton(
                    title: "ToDo",
                    isactive: activeindex == 1,
                    onTap: () {
                      setState(() {
                        allTasks = Hive.box<TaskModel>(AppContstants.taskbox)
                            .values
                            .toList()
                            .where((e) => e.statusText.toLowerCase() == "todo")
                            .toList();
                        activeindex = 1;
                      });
                    },
                  )),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                      child: FilterButton(
                    title: "Completed",
                    isactive: activeindex == 2,
                    onTap: () {
                      setState(() {
                        allTasks = Hive.box<TaskModel>(AppContstants.taskbox)
                            .values
                            .toList()
                            .where((e) =>
                                e.statusText.toLowerCase() == "completed")
                            .toList();
                        activeindex = 2;
                      });
                    },
                  )),
                ],
              ),
              SizedBox(height: 20.h),
              TasksListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String title;
  final bool isactive;
  final void Function()? onTap;
  const FilterButton(
      {super.key, required this.title, this.isactive = false, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.purple),
            borderRadius: BorderRadius.circular(12.r),
            color: isactive ? Colors.purple : Colors.transparent),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              fontSize: 16.sp, color: isactive ? Colors.white : Colors.black),
        )),
      ),
    );
  }
}
