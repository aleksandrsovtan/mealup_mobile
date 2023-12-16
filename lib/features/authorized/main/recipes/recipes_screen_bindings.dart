import 'package:get/get.dart';

import 'recipes_screen_controller.dart';

class RecipesScreenBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<RecipesScreenController>(RecipesScreenController());
  }
}
