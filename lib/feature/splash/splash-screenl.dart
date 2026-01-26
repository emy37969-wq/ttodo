import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class Splashscreenl extends StatelessWidget {
  const Splashscreenl({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset("assets/splash-imag.json"),
            Text(
              "taskati",
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
            ),
            Text(
              "it's time to get organized",
              style: TextStyle(fontSize: 18.sp),
            )
          ],
        ),
      ),
    );
  }
}
