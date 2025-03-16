import '../core/network/app_export.dart';

import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import '../presentation/iphone_16_pro_one_screen/binding/iphone_16_pro_one_binding.dart';
import '../presentation/iphone_16_pro_one_screen/iphone_16_pro_one_screen.dart';
import '../presentation/iphone_16_pro_three_screen/binding/iphone_16_pro_three_binding.dart';
import '../presentation/iphone_16_pro_three_screen/iphone_16_pro_three_screen.dart';
import '../presentation/iphone_16_pro_two_screen/binding/iphone_16_pro_two_binding.dart';
import '../presentation/iphone_16_pro_two_screen/iphone_16_pro_two_screen.dart';

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String iphone16ProOneScreen = '/iphone_16_pro_one_screen';
  static const String iphone16ProThreeScreen = '/iphone_16_pro_three_screen';
  static const String iphone16ProTwoScreen = '/iphone_16_pro_two_screen';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: iphone16ProOneScreen,
      page: () => Iphone16ProOneScreen(),
      bindings: [Iphone16ProOneBinding()],
    ),
    GetPage(
      name: iphone16ProThreeScreen,
      page: () => Iphone16ProThreeScreen(),
      bindings: [Iphone16ProThreeBinding()],
    ),
    GetPage(
      name: iphone16ProTwoScreen,
      page: () => Iphone16ProTwoScreen(),
      bindings: [Iphone16ProTwoBinding()],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [AppNavigationBinding()],
    ),
    GetPage(
      name: initialRoute,
      page: () => Iphone16ProOneScreen(),
      bindings: [Iphone16ProOneBinding()],
    ),
  ];
}
