import 'package:flutter/material.dart';
import 'package:flutter_drive_app/controller/auth_controller.dart';
import 'package:flutter_drive_app/screens/signin_screen.dart';
import 'package:flutter_drive_app/screens/signup_screen.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Firebase Authentication"),),
      body: Column(
        children: [
          const SizedBox(height: 60,),
          TextButton(onPressed: () {
            Get.to(SignInScreen());
          }, child: const Text("Go to Sign In Screen")),
          const SizedBox(height: 20,),
          TextButton(onPressed: () {
            Get.to(SignUpScreen());
          }, child: const Text("Go to Sign Up Screen")),
          const SizedBox(height: 20,),
          TextButton(onPressed: () {
            authController.getOTPRepo();
          }, child: Text("Go to OTP Screen")),
          TextButton(onPressed: () {

          }, child: Text("Email Login")),
        ],
      ),
    );
  }
}
