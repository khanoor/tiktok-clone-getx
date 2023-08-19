import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/controllres/auth_controller.dart';
import 'package:tiktok/views/screens/auth/login_screen.dart';
import 'package:tiktok/views/screens/auth/signup_screen.dart';

import 'constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Tiktok Colne',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
      debugShowCheckedModeBanner: false,
      home: SignupScreen(),
    );
  }
}
