import 'package:get/get.dart';

import 'sign_in_screen_controller.dart';

class SignInScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SignInScreenController>(SignInScreenController());
  }
}
