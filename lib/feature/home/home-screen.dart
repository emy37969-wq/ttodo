// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo2_application_1/core/widgets/custom_app_button.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            spacing: 20.h,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100.r,
                backgroundColor: Colors.blueAccent.shade100,
                child: Icon(
                  Icons.person,
                  size: 150.r,
                  color: Colors.white,
                ),
              ),
              CustomAppButton(
                title: "upload from camera",
                onpressed: () async {
                  await picker.pickImage(source: ImageSource.camera);
                },
              ),
              CustomAppButton(
                title: "upload from gallery",
              ),
              Divider(color: Colors.grey),
              TextFormField(
                onTapOutside: (v) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigoAccent),
                  ),
                ),
              ),
              CustomAppButton(
                title: "done",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
