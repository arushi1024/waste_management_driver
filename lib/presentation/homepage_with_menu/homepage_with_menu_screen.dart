import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../core/app_export.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_title.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import 'controller/homepage_with_menu_controller.dart'; // ignore_for_file: must_be_immutable

class HomepageWithMenuScreen extends GetWidget<HomepageWithMenuController> {
  const HomepageWithMenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimaryContainer,
      appBar: _buildAppBar(),
      body: SafeArea(
        top: false,
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.only(top: 8.h),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgTempimage7v1c0j,
                height: 398.h,
                width: double.maxFinite,
              ),
              Container(
                width: double.maxFinite,
                margin: EdgeInsets.symmetric(horizontal: 44.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.iphone16ProSevenScreen);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 22.h),
                        child: Column(
                          spacing: 22,
                          children: [
                            CustomImageView(
                              imagePath: ImageConstant.imgTempimagerobdau,
                              height: 94.h,
                              width: 94.h,
                              radius: BorderRadius.circular(4.h),
                              margin: EdgeInsets.only(left: 8.h, right: 12.h),
                            ),
                            Text(
                              "lbl_my_pickups".tr,
                              style: theme.textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget: AppBar
  PreferredSizeWidget _buildAppBar() {
  return CustomAppBar(
    leadingWidth: 47.h,
    leading: AppbarLeadingImage(
      imagePath: ImageConstant.imgTempimageymyxm5,
      margin: EdgeInsets.only(left: 5.h),
      onTap: () {
        // Navigate to slide screen when image is tapped
        Get.toNamed(AppRoutes.slideScreen);
      },
    ),
    title: Container(
      height: 54.h,
      width: 260.h,
      margin: EdgeInsets.only(right: 45.h),
      child: Stack(
        children: [
          AppbarTitle(
            text: "1bl_welcome".tr,
          ),
        ],
      ),
    ),
  );
}
}