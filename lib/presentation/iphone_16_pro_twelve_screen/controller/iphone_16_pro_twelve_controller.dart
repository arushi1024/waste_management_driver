import 'package:flutter/material.dart'; 
import'../../../core/app_export.dart'; 
import'../models/iphone_16_pro_twelve_model.dart';
// A controller class for the Iphone16ProTwelveScreen.
///
/// This class manages the state of the Iphone16ProTwelveScreen, including the /I/ current iphone16ProTwelveModelObj
class Iphone16ProTwelveController extends GetxController {
  var pickupPoints=<Iphone16ProTwelveModel>[].obs;
void setPickupPoints(List<String> addresses){
   pickupPoints.assignAll(addresses.map((addr) => Iphone16ProTwelveModel(address: addr)).toList(),
   );
}
}