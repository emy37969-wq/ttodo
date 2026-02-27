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
import 'package:todo2_application_1/feature/home/widgets/add-task-row.dart';
import 'package:todo2_application_1/feature/home/widgets/home-app-bar.dart';
import 'package:todo2_application_1/feature/home/widgets/tasks-list-view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              TasksListView(),
            ],
          ),
        ),
      ),
    );
  }
}
