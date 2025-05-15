import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/app_export.dart';
import '../models/iphone_16_pro_three_model.dart'; 
import 'package:waste_management_driver/core/utils/shared_preferences_helper.dart';




class DriverSignupController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController vehicleNumberController = TextEditingController(); 

  Rx<Iphone16ProThreeModel> driverSignupModelObj = Iphone16ProThreeModel().obs;
  
  Rx<String> userTypeSelection = "driver".obs; 

  Future<void> signUpDriver() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final name = nameController.text.trim();

    
    if ( email.isEmpty || password.isEmpty) {
      Get.snackbar("Input Error", "Please enter all fields.");
      return;
    }

    try {
      
      final userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
          await SharedPrefsHelper.saveUserDetails(name: name, email: email, userType: "driver");


      final uid = userCredential.user?.uid;

      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': name,
        'email': email,
        'userType': userTypeSelection.value,
         
         'vehicleNumber' : vehicleNumberController.text.trim()
      });

      
      
      
      

      Get.snackbar("Success", "Driver signed up: ${userCredential.user?.email}");

      
      Get.offAllNamed(AppRoutes.iphone16ProTwoScreen); 

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

      
     
          
         
      
      
    
  
  @override
  void onClose() {
    super.onClose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
