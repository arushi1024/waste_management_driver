import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:waste_management_driver/widgets/complaints.dart';
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
                    // Option for "My Pickups"
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.iphone16ProTwelveScreen);
                      },
                      child: Container(
                        // padding: EdgeInsets.symmetric(horizontal: 22.h),
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
                    // Option for "View Complaints"
                    GestureDetector(
                      onTap: () {
                        // Navigate to complaints page
                        // Get.toNamed(AppRoutes.viewComplaintsScreen);
                         Navigator.push(
                      context,
                      MaterialPageRoute(builder: (x) => ViewComplaintsScreen()),
                    );
                      },
                      child: Container(
                        // padding: EdgeInsets.symmetric(horizontal: 22.h),
                        child: Column(
                          spacing: 22,
                          children: [
                            Icon(
                              Icons.report_problem, // Complaint icon
                              size: 94.h,
                              color: theme.colorScheme.primary,
                            ),
                            Text(
                              "view complaints against me", // Label for Complaints
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
  return PreferredSize(
    preferredSize: Size.fromHeight(70.h),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.slideScreen);
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                ImageConstant.imgTempimageymyxm5,
                height: 40.h,
                width: 40.h,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 16.h),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "👋 Hello!", // Could also be dynamic or localized
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  "1bl_welcome".tr,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
}
