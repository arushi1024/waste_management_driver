import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import '../models/iphone_16_pro_three_model.dart';

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

  @override
  void onClose() {
    super.onClose();
    nametwoController.dispose();
    emailtwoController.dispose();
    passwordtwoController.dispose();
  }
}
