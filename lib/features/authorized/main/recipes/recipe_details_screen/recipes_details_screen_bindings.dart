import 'package:get/get.dart';

import 'recipes_details_screen_controller.dart';

class RecipeDetailsScreenBindings extends Bindings {
  @override
  void dependencies() {
    final args = Get.arguments as Map<String, dynamic>?;
    if (args != null) {
      Get.put<RecipeDetailsScreenController>(
        RecipeDetailsScreenController(recipe: args['recipe']),
      );
    }
  }
}
