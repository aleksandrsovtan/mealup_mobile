import 'package:get/get.dart';

import 'more_screen_controller.dart';

class MoreScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<MoreScreenController>(MoreScreenController());
  }
}
