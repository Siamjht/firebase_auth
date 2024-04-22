
import 'package:flutter/material.dart';
import 'package:flutter_drive_app/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends StatelessWidget {
  OTPScreen({super.key});

  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OTP Screen"),),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            PinCodeTextField(
              autoDisposeControllers: false,
              length: 6,
              obscureText: false,
              controller: authController.otpController,
              keyboardType: TextInputType.number,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              validator: (value) {
                if (value!.length != 6) {
                  return "Please enter the OTP code.".tr;
                } else {
                  return null;
                }
              },
              pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 56,
                  fieldWidth: 50,
                  activeFillColor: Colors.transparent,
              ),
              backgroundColor: Colors.transparent,
              enableActiveFill: true,
              onCompleted: (v) {},
              onChanged: (value) {},
              beforeTextPaste: (text) {
                return true;
              },
              appContext: context,
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              authController.setOTPRepo();
            }, child: Text("Verify OTP"))
          ],
        ),
      ),
    );
  }
}
