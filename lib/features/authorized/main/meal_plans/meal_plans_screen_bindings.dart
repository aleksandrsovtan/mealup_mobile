import 'package:get/get.dart';

import 'meal_plans_screen_controller.dart';

class MealPlansScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<MealPlansScreenController>(MealPlansScreenController());
  }
}
