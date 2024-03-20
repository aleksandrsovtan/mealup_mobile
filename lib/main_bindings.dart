import 'package:get/get.dart';
import 'package:mealsup_mobile/data/datasource/auth_local_data_store.dart';
import 'package:mealsup_mobile/data/repository/auth_repository.dart';
import 'package:mealsup_mobile/data/services/auth_service.dart';
import 'package:mealsup_mobile/data/services/recipe_service.dart';
import 'package:mealsup_mobile/features/unauthorized/splash/splash_screen_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    ///local database repositories
    Get.put<AuthLocalDataStore>(const AuthLocalDataStore());

    //app services
    Get.put(AuthService());
    Get.put(RecipeService());

    //remote database repositories
    Get.put<AuthRepository>(AuthRepository());

    //user controller
    Get.put<SplashScreenController>(SplashScreenController());

    // Get.put<UserAuthorizationController>(UserAuthorizationController());
  }
}
