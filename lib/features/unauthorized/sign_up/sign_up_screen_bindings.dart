import 'package:get/get.dart';

import 'sign_up_screen_controller.dart';

class SignUpScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SignUpScreenController>(SignUpScreenController());
  }
}
