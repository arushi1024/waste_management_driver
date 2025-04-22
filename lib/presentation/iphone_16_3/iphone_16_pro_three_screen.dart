import 'package:flutter/material.dart';
import 'package:waste_management_driver/core/app_export.dart';
import 'package:waste_management_driver/core/utils/validations_functions.dart';
import 'package:waste_management_driver/theme/custom_button_style.dart';
import 'package:waste_management_driver/widgets/custom_elevated_button.dart';
import 'package:waste_management_driver/widgets/custom_radio_button.dart';
import 'package:waste_management_driver/widgets/custom_text_form_field.dart';
import 'controller/iphone_16_pro_three_controller.dart';

class Iphone16ProThreeScreen extends GetWidget<DriverSignupController> {
  Iphone16ProThreeScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.h, vertical: 32.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "lbl_sign_up".tr,
                      style: CustomTextStyles.headlineMediumBlack900_2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 24.h),

                  _buildNameInputSection(),
                  SizedBox(height: 16.h),

                  _buildEmailInputSection(),
                  SizedBox(height: 16.h),

                  _buildPasswordInputSection(),
                  SizedBox(height: 8.h),
                   Text(
                    "msg_must_be_at_least".tr,
                    style: CustomTextStyles.bodyMediumRobotoBlack900,
                  ),
                  SizedBox(height: 16.h),

                  _buildVehicleNumberInputSection(),
                  SizedBox(height: 8.h),

                 
                  SizedBox(height: 8.h),

                  Text(
                    "lbl_you_are".tr,
                    style: CustomTextStyles.titleLargeGray900,
                  ),
                  SizedBox(height: 8.h),

                  _buildUserTypeSelection(),
                  SizedBox(height: 32.h),

                  CustomElevatedButton(
                    text: "msg_create_an_account".tr.toUpperCase(),
                    buttonStyle: CustomButtonStyles.fillTeal,
                    buttonTextStyle: CustomTextStyles.titleLargeOnPrimaryContainer,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.signUpDriver();
                      }
                    },
                  ),
                  SizedBox(height: 48.h),

                  Center(
                    child: GestureDetector(
                      onTap: onTapTxtIAlreadyHaveAn2,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "msg_already_have_an".tr,
                              style: theme.textTheme.bodyLarge,
                            ),
                            TextSpan(
                              text: "lbl_log_in".tr,
                              style: theme.textTheme.titleMedium,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("lbl_name".tr, style: theme.textTheme.bodyLarge),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: controller.nameController,
          hintText: "lbl_enter_your_name".tr,
          validator: (value) {
            if (!isText(value)) {
              return "err_msg_please_enter_valid_text".tr;
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildEmailInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("lbl_email".tr, style: theme.textTheme.bodyLarge),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: controller.emailController,
          hintText: "msg_enter_your_email".tr,
          textInputType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  Widget _buildPasswordInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("lbl_password".tr, style: theme.textTheme.bodyLarge),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: controller.passwordController,
          hintText: "msg_create_a_password".tr,
          textInputAction: TextInputAction.done,
          textInputType: TextInputType.visiblePassword,
          obscureText: true,
          validator: (value) {
            if (value == null || !isValidPassword(value, isRequired: true)) {
              return "err_msg_please_enter_valid_password".tr;
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildVehicleNumberInputSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Vehicle Number", style: theme.textTheme.bodyLarge),
        SizedBox(height: 8.h),
        CustomTextFormField(
          controller: controller.vehicleNumberController,
          hintText: "Enter your Vehicle Number",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Vehicle Number";
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildUserTypeSelection() {
    return Obx(() => Column(
      children: [
        CustomRadioButton(
          text: "lbl_customer".tr.toUpperCase(),
          value: "lbl_customer".tr,
          groupValue: controller.userTypeSelection.value,
          onChange: (value) {
            controller.userTypeSelection.value = value;
          },
        ),
        SizedBox(height: 16.h),
        CustomRadioButton(
          text: "lbl_collector".tr.toUpperCase(),
          value: "lbl_collector".tr,
          groupValue: controller.userTypeSelection.value,
          onChange: (value) {
            controller.userTypeSelection.value = value;
          },
        ),
      ],
    ));
  }

  void onTapTxtIAlreadyHaveAn2() {
    Get.toNamed(AppRoutes.iphone16ProTwoScreen);
  }
}

