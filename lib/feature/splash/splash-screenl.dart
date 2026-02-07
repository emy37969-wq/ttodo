import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:todo2_application_1/feature/auth/auth-screen.dart';

class Splashscreenl extends StatefulWidget {
  const Splashscreenl({super.key});

  @override
  State<Splashscreenl> createState() => _SplashscreenlState();
}

class _SplashscreenlState extends State<Splashscreenl> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Authscreen()),
      );
    });
  }

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
