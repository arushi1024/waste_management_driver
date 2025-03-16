import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/iphone_16_pro_two_model.dart';

/// A controller class for the Iphone16ProTwoScreen.
///
/// This class manages the state of the Iphone16ProTwoScreen, including the
/// current iphone16ProTwoModelObj
class Iphone16ProTwoController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<Iphone16ProTwoModel> iphone16ProTwoModelObj = Iphone16ProTwoModel().obs;

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }
}
