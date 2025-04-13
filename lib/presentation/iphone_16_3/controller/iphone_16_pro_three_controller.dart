import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/iphone_16_pro_three_model.dart';
import 'package:waste_management_driver/core/utils/shared_preferences_helper.dart';
/// A controller class for the Iphone16ProThreeScreen.
///
/// This class manages the state of the Iphone16ProThreeScreen, including the
/// current iphone16ProThreeModelObj.
class Iphone16ProThreeController extends GetxController {
  TextEditingController nametwoController = TextEditingController();
  TextEditingController emailtwoController = TextEditingController();
  TextEditingController passwordtwoController = TextEditingController();

  Rx<Iphone16ProThreeModel> iphone16ProThreeModelObj =
      Iphone16ProThreeModel().obs;

  Rx<String> userTypeSelection = "".obs;
  Future<void> signUpUser() async {
    final name = nametwoController.text.trim();
    final email = emailtwoController.text.trim();
    final password = passwordtwoController.text.trim();

      if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Input Error", "Please enter email and password");
      return;
    }
    if (userTypeSelection.value.isEmpty) {
    Get.snackbar("Input Error", "Please select a user type.");
    return;
}
      final userCredential = //await FirebaseAuth.instance
          //.createUserWithEmailAndPassword(email: email, password: password);
         await SharedPrefsHelper.saveUserDetails(name: name, email: email, userType: userTypeSelection.value);
      //Get.snackbar("Success", "Signed up: ${userCredential.user?.email}");
      Get.offAllNamed(AppRoutes.iphone16ProTwoScreen);
      // Optionally navigate to another screen:
      // Get.toNamed(AppRoutes.homeScreen);
    
  }
  @override
  void onClose() {
    super.onClose();
    nametwoController.dispose();
    emailtwoController.dispose();
    passwordtwoController.dispose();
  }
}
