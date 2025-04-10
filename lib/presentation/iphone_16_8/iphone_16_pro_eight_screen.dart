import 'package:flutter/material.dart';
import 'package:waste_management/widgets/app_bar/appbar_leading_image.dart';
import 'package:waste_management/widgets/app_bar/custom_app_bar.dart';
import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/custom_elevated_button.dart';
import 'controller/iphone_16_pro_eight_controller.dart'; // ignore_for_file: must_be_immutable

class Iphone16ProEightScreen extends GetWidget<Iphone16ProEightController> {
  const Iphone16ProEightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTheme.lightGreen30001,
      appBar: _buildAppBar(),
      body: SafeArea(
        top: false,
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            vertical: 20.h,
          ),
          child: Column(
            children: [
              Container(
                decoration: AppDecoration.outlineBlueGray,
                child: Text("lbl_my_pick_ups".tr,
                textAlign: TextAlign.center,
                style: theme.textTheme.displayMedium,),
              ),
              Spacer(flex: 23,),
              CustomImageView(
                imagePath: ImageConstant.imgTempimagefii5kq,
                height: 198.h,
                width: double.maxFinite,
                margin: EdgeInsets.only(right: 4.h),
              ),
              Spacer(
                flex: 76,
              )
            ],
          ),
        ),
      ),
    );
  }
  ///Section Widget
  PreferredSizeWidget _buildAppBar(){
    return CustomAppBar(
      height: 56.h,
      leadingWidth: 55.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgTempimagez2xc80,
        margin: EdgeInsets.only(left: 13.h),
        onTap: (){
          onTapImgTempimagez2xcei();
        },
      ),
    );
  }

  onTapImgTempimagez2xcei(){
    Get.toNamed(AppRoutes.homepageWithMenuScreen,);
  }
}