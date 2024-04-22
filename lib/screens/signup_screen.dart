
import 'package:flutter/material.dart';
import 'package:flutter_drive_app/controller/auth_controller.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  AuthController authController = Get.put(AuthController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(
              controller: authController.emailController,
              decoration: InputDecoration(
                hintText: "Email"
              ),
            ),
            TextFormField(
              controller: authController.passwordController,
              decoration: InputDecoration(
                  hintText: "Password"
              ),
            ),
            TextFormField(
              controller: authController.nameController,
              decoration: InputDecoration(
                  hintText: "Name"
              ),
            ),
            TextFormField(
              controller: authController.mobileController,
              decoration: InputDecoration(
                  hintText: "Mobile"
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: () {
              authController.signUpRepo();
            }, child: Text("SignUP")),
          ],
        ),
      ),
    );
  }
}
