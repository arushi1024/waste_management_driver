import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/iphone_16_pro_two_model.dart';
import 'package:waste_management_driver/core/utils/shared_preferences_helper.dart';
import 'package:waste_management_driver/presentation/frame_seventeen_screen/controller/frame_seventeen_controller.dart';

/// A controller class for the Iphone16ProTwoScreen.
///
/// This class manages the state of the Iphone16ProTwoScreen, including the
/// current iphone16ProTwoModelObj
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

      
      final userDetails = await SharedPrefsHelper.getUserDetails();


      if (userDetails['email'] == email) {
        final profileController = Get.put(FrameSeventeenController());
        profileController.userName.value = userDetails['name'] ?? '';
        profileController.userEmail.value = userDetails['email'] ?? '';
        profileController.userType.value = userDetails['userType'] ?? '';
      }
      Get.snackbar("Login Success", "Welcome back!");

      // Navigate to home or dashboard screen
      Get.offAllNamed(AppRoutes.homepageWithMenuScreen); // change this as needed

   
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
