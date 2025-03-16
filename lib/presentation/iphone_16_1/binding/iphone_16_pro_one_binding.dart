import '../../../core/app_export.dart';
import '../controller/iphone_16_pro_one_controller.dart';

/// A binding class for the Iphone16ProOneScreen.
///
/// This class ensures that the Iphone16ProOneController is created when the
/// Iphone16ProOneScreen is first loaded.
class Iphone16ProOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Iphone16ProOneController());
  }
}
