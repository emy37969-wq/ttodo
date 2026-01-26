// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo2_application_1/feature/splash/splash-screenl.dart';

class Todoapp extends StatelessWidget {
  const Todoapp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        home: Splashscreenl()
      ),
    );
  }
}
