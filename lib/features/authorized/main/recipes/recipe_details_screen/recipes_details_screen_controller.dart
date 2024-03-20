import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/data/model/response/ingredient_model.dart';
import 'package:mealsup_mobile/data/model/response/nutrition_model.dart';
import 'package:mealsup_mobile/data/model/response/recipe_model.dart';
import 'package:mealsup_mobile/data/model/response/step_model.dart';
import 'package:mealsup_mobile/data/services/recipe_service.dart';

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
    getRecipes();
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

  Future<void> getRecipes() async {
    await Get.find<RecipeService>().getRecipes();
  }

  Future<void> createRecipe() async {
    await Get.find<RecipeService>().createRecipe(
      const RecipeModel(
        id: 'id_1a',
        image:
            'https://cdn.loveandlemons.com/wp-content/uploads/2021/04/green-salad.jpg',
        name: 'Simple Green Salad',
        description:
            'We all need a good green salad recipe in our back pocket…which is why I can’t believe that in almost 10(!) years of blogging, I haven’t shared a simple green salad until today. That’s not to say that there’s a shortage of salad recipes on the site (broccoli salad, pasta salad, or avocado salad, anyone?). But it has been missing a quick, refreshing salad that you can toss together at the last minute and serve with almost anything.',
        nutritions: NutritionModel(
          calories: 233,
          fat: 32,
          protein: 44.2,
          garbs: 3.6,
        ),
        preparationTime: 35,
        preparationSteps: [
          StepModel(
            title: 'Make a trivet',
            description:
                "Preheat the oven to gas 7, 220°C, fan 200°C. Pat dry 1 x 1kg piece rolled pork belly with kitchen paper. Peel 3 small white onions, then cut each one in half through the root. Trim a little bit off the rounded side of each onion and lay flat-side-up in a roasting tin. This will act as a trivet for the pork, so it doesn't burn.",
            imageUrl:
                'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2023/5/16/FNK_How-to-cut-and-onion_Shot_5.jpg.rend.hgtvcom.476.317.suffix/1684267494104.jpeg',
          ),
          StepModel(
            title: 'Make a trivet',
            description:
                "Preheat the oven to gas 7, 220°C, fan 200°C. Pat dry 1 x 1kg piece rolled pork belly with kitchen paper. Peel 3 small white onions, then cut each one in half through the root. Trim a little bit off the rounded side of each onion and lay flat-side-up in a roasting tin. This will act as a trivet for the pork, so it doesn't burn.",
            imageUrl:
                'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2023/5/16/FNK_How-to-cut-and-onion_Shot_5.jpg.rend.hgtvcom.476.317.suffix/1684267494104.jpeg',
          ),
          StepModel(
            title: 'Make a trivet',
            description:
                "Preheat the oven to gas 7, 220°C, fan 200°C. Pat dry 1 x 1kg piece rolled pork belly with kitchen paper. Peel 3 small white onions, then cut each one in half through the root. Trim a little bit off the rounded side of each onion and lay flat-side-up in a roasting tin. This will act as a trivet for the pork, so it doesn't burn.",
            imageUrl:
                'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2023/5/16/FNK_How-to-cut-and-onion_Shot_5.jpg.rend.hgtvcom.476.317.suffix/1684267494104.jpeg',
          ),
          StepModel(
            title: 'Make a trivet',
            description:
                "Preheat the oven to gas 7, 220°C, fan 200°C. Pat dry 1 x 1kg piece rolled pork belly with kitchen paper. Peel 3 small white onions, then cut each one in half through the root. Trim a little bit off the rounded side of each onion and lay flat-side-up in a roasting tin. This will act as a trivet for the pork, so it doesn't burn.",
            imageUrl:
                'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2023/5/16/FNK_How-to-cut-and-onion_Shot_5.jpg.rend.hgtvcom.476.317.suffix/1684267494104.jpeg',
          ),
          StepModel(
            title: 'Make a trivet',
            description:
                "Preheat the oven to gas 7, 220°C, fan 200°C. Pat dry 1 x 1kg piece rolled pork belly with kitchen paper. Peel 3 small white onions, then cut each one in half through the root. Trim a little bit off the rounded side of each onion and lay flat-side-up in a roasting tin. This will act as a trivet for the pork, so it doesn't burn.",
            imageUrl:
                'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2023/5/16/FNK_How-to-cut-and-onion_Shot_5.jpg.rend.hgtvcom.476.317.suffix/1684267494104.jpeg',
          ),
          StepModel(
            title: 'Make a trivet',
            description:
                "Preheat the oven to gas 7, 220°C, fan 200°C. Pat dry 1 x 1kg piece rolled pork belly with kitchen paper. Peel 3 small white onions, then cut each one in half through the root. Trim a little bit off the rounded side of each onion and lay flat-side-up in a roasting tin. This will act as a trivet for the pork, so it doesn't burn.",
            imageUrl:
                'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2023/5/16/FNK_How-to-cut-and-onion_Shot_5.jpg.rend.hgtvcom.476.317.suffix/1684267494104.jpeg',
          ),
        ],
        ingredients: [
          IngredientModel(name: 'Onion', value: '1/2'),
          IngredientModel(name: 'Water', value: '300 ml'),
          IngredientModel(name: 'Potato', value: '1kg'),
          IngredientModel(name: 'Water', value: '300 ml'),
          IngredientModel(name: 'Onion', value: '1/2'),
          IngredientModel(name: 'Water', value: '300 ml'),
        ],
      ),
    );
  }
}
