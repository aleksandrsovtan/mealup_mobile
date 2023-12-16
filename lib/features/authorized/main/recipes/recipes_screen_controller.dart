import 'package:get/get.dart';

class RecipesScreenController extends GetxController {
  final RxBool isFavorite = RxBool(false);

  void onFavoriteTapped(final bool value) {
    isFavorite.value = value;
  }
}
