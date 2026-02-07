import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo2_application_1/feature/auth/models/user_model.dart';

class HomeAppBar extends StatelessWidget {
  final UserModel? userData;
  const HomeAppBar({super.key, this.userData, required UserModel userdata});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, ${userData?.name ?? "user"}",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Have A Nice Day",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
        CircleAvatar(
          backgroundImage: userData?.Image.isNotEmpty ?? false
              ? FileImage(File(userData!.Image))
              : null,
          backgroundColor: Colors.grey,
          minRadius: 40.sp,
        ),
      ],
    );
  }
}