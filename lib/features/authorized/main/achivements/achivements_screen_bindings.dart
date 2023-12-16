import 'package:get/get.dart';

import 'achivements_screen_controller.dart';

class AchivementsScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AchivementsScreenController>(AchivementsScreenController());
  }
}
