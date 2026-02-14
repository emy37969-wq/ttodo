// ignore: file_names
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo2_application_1/core/app_contstants.dart';
import 'package:todo2_application_1/core/widgets/custom_app_button.dart';
import 'package:todo2_application_1/feature/auth/models/user_model.dart';
import 'package:todo2_application_1/feature/home/widgets/home-screen.dart';

class Authscreen extends StatefulWidget {
  const Authscreen({super.key});

  @override  
  State<Authscreen> createState() => _AuthscreenState();

}

class _AuthscreenState extends State<Authscreen> {

  final ImagePicker picker = ImagePicker();
  XFile? image;
  TextEditingController namecontroller = TextEditingController();
  void opencamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    setState(() {});
  }

  void opengallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

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
              Visibility(
                  visible: image == null,
                  child: CircleAvatar(
                    radius: 100.r,
                    backgroundColor: Colors.blueAccent.shade100,
                    child: Icon(
                      Icons.person,
                      size: 150.r,
                      color: Colors.white,
                    ),
                  ),
                  replacement: Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.file(File(image?.path ?? "")).image,
                        )),
                  )),
              CustomAppButton(
                title: "Upload from Camera",
                onpressed:  () {
                  opencamera();
                }, onPressed: () {  },
              ),
              CustomAppButton(
                title: "Upload from Gallery",
                onpressed: () {
                  opengallery();
                }, onPressed: () {  },
              ),
              Divider(color: Colors.grey),
              
              CustomAppButton(
                title: "Login",
                                onpressed: () {
                  if (image == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Image is required"),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  Hive.box<UserModel>(AppContstants.userbox)
                      .add(
                        UserModel(
                          Image: image!
                              .path, name: '', 
                        ),
                      )
                      .then((v) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Homescreen(),
                          ),
                        );
                      });
                }, onPressed: () {  },

              ),
            ],
          ),
        ),
      ),
    );
  }
}
