
import 'package:assist_landing_page/screens/landing_page/controller/landing_controller.dart';
import 'package:get/get.dart';

class ScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LandingController());
  }
}
