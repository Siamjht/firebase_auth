

import 'package:flutter/material.dart';
import 'package:flutter_drive_app/controller/auth_controller.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signin Screen"),
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
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              authController.signInRepo();
            }, child: Text("Sign In"))
          ],
        ),
      ),
    );
  }
}
