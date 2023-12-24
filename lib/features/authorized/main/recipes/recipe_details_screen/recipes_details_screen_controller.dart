import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/data/model/response/recipe_model.dart';

class RecipeDetailsScreenController extends GetxController {
  RecipeDetailsScreenController({required this.recipe});

  final RecipeModel recipe;
  final ScrollController scrollController = ScrollController();

  final RxBool isLiked = RxBool(false);
  final RxDouble rating = RxDouble(0.0);
  final RxBool isExpanded = RxBool(false);
  final RxBool isExpandedButtonVisible = RxBool(false);
  final RxBool isPreparationsTab = RxBool(false);

  @override
  void onInit() {
    //Temporary
    print(recipe);
    rating.value = 4.5;
//
    scrollController.addListener(() {
      if (scrollController.offset >= 50 && isExpanded.isFalse) {
        isExpanded.value = true;
      }
      if (scrollController.offset == 0 && isExpanded.isTrue) {
        isExpandedButtonVisible.value = true;
      }
    });
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void onLikeTapped() {
    isLiked.toggle();
  }

  void onRatingUpdate(final double value) {
    rating.value = value;
  }

  void onExpandedButtonTapped() {
    isExpandedButtonVisible.value = false;
    isExpanded.value = false;
  }

  void onPreparationsTabTapped(final bool value) {
    isPreparationsTab.value = value;
  }
}
