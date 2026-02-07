import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo2_application_1/core/app_contstants.dart';
import 'package:todo2_application_1/feature/auth/models/user_model.dart';
import 'package:todo2_application_1/feature/home/models/task-model.dart';
import 'package:todo2_application_1/feature/home/widgets/add-task-row.dart';
import 'package:todo2_application_1/feature/home/widgets/home-app-bar.dart';
import 'package:todo2_application_1/feature/home/widgets/task-item.dart';

class Homescreen extends StatelessWidget {
  final Map<String, dynamic> userdata;
  const Homescreen({super.key, required this.userdata});

  @override
  Widget build(BuildContext context) {
    var userdata = Hive.box<UserModel>(AppContstants.userbox).getAt(0);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            if (userdata != null) HomeAppBar(userdata: userdata),
            SizedBox(
              height: 20.h,
            ),
            
            Addtaskrow(),
            
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Dismissible(
                      background: Icon(Icons.delete),
                      secondaryBackground:Icon(Icons.add_a_photo) ,
                      key: UniqueKey(),
                      child: Taskitem(
                        task: alltasks[index],
                      ),
                      
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: 10.h,
                      ),
                  itemCount: alltasks.length),
            ),
          ],
        ),
      )),
    );
  }
}
