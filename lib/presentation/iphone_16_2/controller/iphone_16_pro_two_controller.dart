import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import '../../../core/app_export.dart';
import '../models/iphone_16_pro_two_model.dart';
import 'package:waste_management_driver/core/utils/shared_preferences_helper.dart';
import 'package:waste_management_driver/presentation/frame_seventeen_screen/controller/frame_seventeen_controller.dart';

class Iphone16ProTwoController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<Iphone16ProTwoModel> iphone16ProTwoModelObj = Iphone16ProTwoModel().obs;
   Future<void> loginUser() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Login Error", "Please enter both email and password");
      return;
    }
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final userDetails =await SharedPrefsHelper.getUserDetails();
       if (userDetails['email'] == email) {
        final profileController = Get.put(FrameSeventeenController());
        profileController.userName.value = userDetails['name'] ?? '';
        profileController.userEmail.value = userDetails['email'] ?? '';
        profileController.userType.value = userDetails['userType'] ?? '';
      }
      Get.snackbar("Login Success", "Welcome back!");


      // Navigate to the driver homepage (update the route as needed)
      Get.offAllNamed(AppRoutes.homepageWithMenuScreen); // replace with your actual route

    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'user-not-found':
          message = 'No user found for that email.';
          break;
        case 'wrong-password':
          message = 'Incorrect password.';
          break;
        default:
          message = e.message ?? 'Login failed';
      }
      Get.snackbar("Login Failed", message);
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    }
  }
  Future<void> markAttendanceOnLogin() async {
    log("attendance worked");
  final user = FirebaseAuth.instance.currentUser;
  if (user == null) return;

  final uid = user.uid;
  final today = DateFormat('d-M-yyyy').format(DateTime.now());

  final docRef = FirebaseFirestore.instance.collection('attendance').doc(uid);

  final docSnapshot = await docRef.get();

  if (docSnapshot.exists) {
    List<dynamic> attendanceList = docSnapshot.data()?['attendance'] ?? [];

    if (!attendanceList.contains(today)) {
      attendanceList.add(today);
      await docRef.update({'attendance': attendanceList});
    }
  } else {
    await docRef.set({
      'id': uid,
      'attendance': [today],
    });
  }
}


  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
