import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo2_application_1/core/widgets/custom-text-form-filed.dart';
import 'package:todo2_application_1/core/widgets/custom_app_button.dart';

class Updateprofilescreen extends StatefulWidget {
  const Updateprofilescreen({super.key, required String name, required String image});

  @override
  State<Updateprofilescreen> createState() => _UpdateprofilescreenState();
}

class _UpdateprofilescreenState extends State<Updateprofilescreen> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
          SizedBox(
            height: 20.h,
          ),
          Divider(color: const Color.fromRGBO(158, 158, 158, 1)),
          SizedBox(
            height: 20.h,
          ),
          CustomAppButton(
            title: "Edit Profile",
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 20.h,
                        children: [
                          CustomAppButton(
                              title: "Upload from Camera",
                              onPressed: () {
                                opencamera();
                              }),
                          CustomAppButton(
                              title: "Upload from Gallery",
                              onPressed: () {
                                opengallery();
                              }),
                        ],
                      ),
                    );
                  });
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomAppButton(
            title: "Edit Name",
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        spacing: 20.h,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomTextFormFiled(
                              controller: namecontroller,
                              hintText: "",
                            ),
                          ),
ElevatedButton(
  onPressed: () {

    Navigator.pop(
      context,
      namecontroller.text,
    );

  },
  child: Text("Update Name"),
)                        ],
                      ),
                    );
                  });
            },
          ),
        ],
      ),
    );
  }
}
