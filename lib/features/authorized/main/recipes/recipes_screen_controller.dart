import 'package:get/get.dart';

class RecipesScreenController extends GetxController {
  final RxBool isFavoriteTab = RxBool(false);
  final RxBool isLiked = RxBool(false);

  void onFavoriteTabTapped(final bool value) {
    isFavoriteTab.value = value;
  }

  void onLikeTapped() {
    isLiked.toggle();
  }
}
