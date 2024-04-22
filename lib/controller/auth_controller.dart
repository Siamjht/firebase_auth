

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_drive_app/screens/otp_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  ///<<<================== Sign Up Repo ===========================>>>

  Future < void > signUpRepo() async {
    try {
      var response = await firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      ).then((value) async {
        await firebaseFirestore.collection("users").doc(value.user!.uid).set({
          "name": nameController.text,
          "email": emailController.text,
          "mobile": mobileController.text,
        });

      });
      print("response :  ${response}");
      Get.snackbar("SignUp Success", "");
      print("success");
    } catch (e) {
      print("Error");
    }
  }

  Future<void> signInRepo() async{
    try{
      await firebaseAuth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
      Get.snackbar("SignIn Success", "");

    }catch(e){
      print(e);
    }

  }
  String verifyId = "";
  Future<void> getOTPRepo() async{
    try{
      await firebaseAuth.verifyPhoneNumber(
          verificationCompleted: (PhoneAuthCredential credential) {
            print("Credential::::>>> $credential");
          },
          verificationFailed: (FirebaseAuthException exception) {
            print("Exception::::>>> $exception");
          },
          codeSent: (verificationId, forceResendingToken) {
            verifyId = verificationId;
            print("Verification ID::::>>> $verificationId");
          },
          codeAutoRetrievalTimeout: (verificationId) {
            print("Verification ID::::>>> $verificationId");
            verifyId = verificationId;
          },
        phoneNumber: "+8801750524477"
      );
      Get.to(OTPScreen());
    }catch(e){
      print(e);
    }
  }

  Future<void> setOTPRepo() async{
    try{
      PhoneAuthProvider.credential(verificationId: verifyId, smsCode: otpController.text);
    }catch(e){
      print(e);
    }
  }
}