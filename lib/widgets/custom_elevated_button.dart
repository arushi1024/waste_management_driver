//import 'package: flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../core/app_export.dart';
import 'base_button.dart';
class CustomElevatedButton extends BaseButton{
CustomElevatedButton (
{super.key, //Key? key,
this.decoration, this.leftIcon, this.rightIcon,
super.margin,
super.onPressed, super.buttonStyle, super.alignment,
super.buttonTextStyle, super.isDisabled, super.height, super.width,
required super.text});
final BoxDecoration? decoration;
final Widget? leftIcon;
final Widget? rightIcon;
@override
Widget build (BuildContext context) {
return alignment != null
? Align(
alignment: alignment ?? Alignment.center, child: buildElevatedButtonWidget)
: buildElevatedButtonWidget;
}
Widget get buildElevatedButtonWidget => Container (
height: height ?? 60.h,
width: width ?? double.maxFinite, margin: margin, decoration: decoration, child: ElevatedButton( style: buttonStyle,
onPressed: isDisabled ?? false? null: onPressed ?? () {},
child: Row(
mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center,
children: [
leftIcon ?? const SizedBox.shrink(),
Text(
text,
style: buttonTextStyle ?? theme.textTheme.headlineMedium,
),
rightIcon ?? const SizedBox.shrink()
],
),
),
) ;
}