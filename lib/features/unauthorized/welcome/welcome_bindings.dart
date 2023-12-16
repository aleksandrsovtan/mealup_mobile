import 'package:get/get.dart';

import 'welcome_screen_controller.dart';

class WelcomeScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<WelcomeScreenController>(WelcomeScreenController());
  }
}
