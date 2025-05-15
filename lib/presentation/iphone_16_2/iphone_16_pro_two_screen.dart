import 'package:flutter/material.dart';
import '../../../core/app_export.dart';
import 'package:waste_management_driver/core/utils/validations_functions.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_outlined_button.dart';
import '../../widgets/custom_text_form_field.dart';
import 'controller/iphone_16_pro_two_controller.dart';

// ignore_for_file: must_be_immutable
class Iphone16ProTwoScreen extends GetWidget<Iphone16ProTwoController> {
  Iphone16ProTwoScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(40.h),
            child: Column(
              children: [
                Container(
                  decoration: AppDecoration.outlineBlack,
                  child: Text(
                    "lbl_log_in".tr,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.headlineMediumBlack900_2,
                  ),
                ),
                SizedBox(height: 62.h),
                _buildLoginForm(),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildEmailInputField() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_email2".tr,
            style: CustomTextStyles.bodyLargeInterOnSecondaryContainer,
          ),
          CustomTextFormField(
            controller: controller.emailController,
            hintText: "lbl_value".tr,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 8.h,
            ),
            borderDecoration: TextFormFieldStyleHelper.outlineBlueGray,
          ),
        ],
      ),
    );
  }

  Widget _buildPasswordInputField() {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "lbl_password2".tr,
            style: CustomTextStyles.bodyLargeInterOnSecondaryContainer,
          ),
          CustomTextFormField(
            controller: controller.passwordController,
            hintText: "lbl_value".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            obscureText: true,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 8.h,
            ),
            borderDecoration: TextFormFieldStyleHelper.outlineBlueGray,
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLoginForm() {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.all(22.h),
      decoration: AppDecoration.outlineBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder8,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEmailInputField(),
          SizedBox(height: 24.h),
          _buildPasswordInputField(),
          SizedBox(height: 24.h),
          CustomOutlinedButton(
            height: 40.h,
            text: "lbl_sign_in".tr,
            buttonTextStyle: CustomTextStyles.bodyLargeInterOnError,
            onPressed: () {
              onTapSignin();
            },
          ),
          SizedBox(height: 16.h),
          Text(
            "msg_forgot_password".tr,
            style: CustomTextStyles.bodyLargeInterOnSecondaryContainer.copyWith(
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  /// Navigates to the homepageWithMenuScreen when the sign-in button is tapped.
  onTapSignin() {
    if (_formKey.currentState!.validate()) {
      controller.loginUser();
      controller.markAttendanceOnLogin();
      // Call the controller's login method
    }
  }
}
