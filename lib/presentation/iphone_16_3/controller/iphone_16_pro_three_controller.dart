import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/app_export.dart';
import '../models/iphone_16_pro_three_model.dart'; // Assuming the same model can be used
import 'package:waste_management_driver/core/utils/shared_preferences_helper.dart';
/// A controller class for the Driver Signup Screen.
/// 
/// This class manages the state of the Driver Signup Screen, including
/// the current driverSignupModelObj.
class DriverSignupController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController(); // New Controller for Vehicle Number

  Rx<Iphone16ProThreeModel> driverSignupModelObj = Iphone16ProThreeModel().obs;
  
  Rx<String> userTypeSelection = "driver".obs; // Default user type for this controller

  Future<void> signUpDriver() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final name = nameController.text.trim();

    // Check if the fields are filled
    if ( email.isEmpty || password.isEmpty) {
      Get.snackbar("Input Error", "Please enter all fields.");
      return;
    }

    try {
      // Create user with Firebase Authentication
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
          await SharedPrefsHelper.saveUserDetails(name: name, email: email, userType: "driver");


      final uid = userCredential.user?.uid;

      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': name,
        'email': email,
        'userType': userTypeSelection.value,
         // or 'driver', etc.
         'vehicleNumber' : vehicleNumberController.text.trim()
      });

      //Get.snackbar("Success", "Signed up: ${userCredential.user?.email}");
      
      // Optional: Save user data to Firestore or any other database if necessary
      // You can save additional info like name, user type, etc.

      Get.snackbar("Success", "Driver signed up: ${userCredential.user?.email}");

      // Navigate to the driver home or dashboard screen
      Get.offAllNamed(AppRoutes.iphone16ProTwoScreen); // Update this with the actual route

    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'weak-password':
          message = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          message = 'The account already exists for that email.';
          break;
        default:
          message = e.message ?? 'Unknown error';
      }
      Get.snackbar("Signup Failed", message);
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    }
  }

      
     //await FirebaseAuth.instance
          //.createUserWithEmailAndPassword(email: email, password: password);
         
      // Optionally navigate to another screen:
      // Get.toNamed(AppRoutes.homeScreen);
    
  
  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
