import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/recipe_details_screen/recipes_details_screen_controller.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/recipe_details_screen/widgets/recipe_details_nutrition_value_item.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';

class RecipeDetailsNutritionRow extends GetView<RecipeDetailsScreenController> {
  const RecipeDetailsNutritionRow({super.key});

  @override
  Widget build(final BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RecipeDetailsNutritionValueItem(
            color: AppColors.primaryColor,
            name: AppLocalizations.of(context)!.calories,
            value: AppLocalizations.of(context)!
                .calories_count(controller.recipe.calories),
          ),
          RecipeDetailsNutritionValueItem(
            color: AppColors.goldenYellow,
            name: AppLocalizations.of(context)!.fat,
            value: AppLocalizations.of(context)!.grams(54.0),
          ),
          RecipeDetailsNutritionValueItem(
            color: AppColors.lightGreen,
            name: AppLocalizations.of(context)!.protein,
            value: AppLocalizations.of(context)!.grams(48.7),
          ),
          RecipeDetailsNutritionValueItem(
            color: AppColors.powder,
            name: AppLocalizations.of(context)!.garbs,
            value: AppLocalizations.of(context)!.grams(5.5),
          ),
        ],
      );
}
