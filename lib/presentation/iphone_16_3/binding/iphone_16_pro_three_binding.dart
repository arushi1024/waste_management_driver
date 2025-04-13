import '../../../core/app_export.dart';
import '../controller/iphone_16_pro_three_controller.dart';

/// A binding class for the Iphone16ProThreeScreen.
///
/// This class ensures that the Iphone16ProThreeController is created when the
/// Iphone16ProThreeScreen is first loaded.
class Iphone16ProThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DriverSignupController());
  }
}
