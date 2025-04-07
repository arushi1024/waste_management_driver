import 'package:flutter/material.dart'; 
import '../../../core/app_export.dart';
import '../controller/frame_seventeen_controller.dart'; 
import '../models/contactinfolist_item_model.dart';
// ignore_for_file: must_be_immutable
class ContactinfolistItemWidget extends StatelessWidget {
ContactinfolistItemWidget(this.contactinfolistItemModelObj, {Key? key})
: super (
key: key,
);
ContactinfolistItemModel contactinfolistItemModelObj;
var controller = Get.find<FrameSeventeenController>();
@override
Widget build(BuildContext context) {
return Padding (
padding: EdgeInsets.only(left: 8.h), child: Row( children: [
Obx (
() => CustomImageView(
imagePath: contactinfolistItemModelObj.nameOne!.value, height: 58.h, width: 58.h,
) ,
),
Expanded(
child: Align(
alignment: Alignment.bottomLeft, child: Padding( padding: EdgeInsets.only(bottom: 2.h), child: Column( spacing: 6, crossAxisAlignment: CrossAxisAlignment.start, children: [
Obx(
() => Text(
contactinfolistItemModelObj.nameTwo!.value, style: theme.textTheme.bodyMedium,
),
),
Obx (
() => Text(
contactinfolistItemModelObj.priyankareddy!.value, style: CustomTextStyles.bodyMediumInter15,
),
)
],
),
),
),
)
],
),
);
}
}