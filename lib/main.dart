import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo2_application_1/core/app_contstants.dart';
import 'package:todo2_application_1/feature/auth/models/user_model.dart';
import 'package:todo2_application_1/todo-app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  await Hive.openBox<UserModel>(AppContstants.userbox);
  runApp(Todoapp());
}