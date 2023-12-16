import 'package:get/get.dart';

class RecipesScreenController extends GetxController {
  final RxBool isFavorite = RxBool(false);
  final RxBool isLiked = RxBool(false);

  void onFavoriteTapped(final bool value) {
    isFavorite.value = value;
  }

  void onLikeTapped() {
    isLiked.toggle();
  }
}
