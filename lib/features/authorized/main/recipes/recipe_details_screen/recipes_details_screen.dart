import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/recipe_details_screen/recipes_details_screen_controller.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/recipe_details_screen/widgets/recipe_details_buttons_row.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/recipe_details_screen/widgets/recipe_details_hidding_button.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/recipe_details_screen/widgets/recipe_details_nutrition_value_item.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/recipe_details_screen/widgets/recipe_details_rating_and_time.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';

class RecipeDetailsScreen extends GetView<RecipeDetailsScreenController> {
  const RecipeDetailsScreen({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: Obx(
          () => Stack(
            children: [
              Positioned.fill(
                bottom: MediaQuery.of(context).size.height * 0.65,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: controller.recipe.image,
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      margin: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: MediaQuery.of(context).padding.top + 24,
                        bottom: controller.isExpanded.value
                            ? 12
                            : MediaQuery.of(context).size.height * 0.2,
                      ),
                      duration: const Duration(milliseconds: 500),
                      child: const RecipeDetailsButtonsRow(),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: SingleChildScrollView(
                          controller: controller.scrollController,
                          physics: const ClampingScrollPhysics(),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical:
                                      controller.isExpandedButtonVisible.value
                                          ? 24
                                          : 16,
                                ),
                                child: Text(
                                  controller.recipe.name,
                                  style: AppTextStyles.h1.copyWith(
                                    color: AppColors.titleColor,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const RecipeDetailsRatingAndTime(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 24),
                                child: Text(
                                  controller.recipe.description,
                                  style: AppTextStyles.dmSans16.copyWith(
                                    color: AppColors.titleColor,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  RecipeDetailsNutritionValueItem(
                                    color: AppColors.primaryColor,
                                    name:
                                        AppLocalizations.of(context)!.calories,
                                    value: AppLocalizations.of(context)!
                                        .calories_count(
                                            controller.recipe.calories),
                                  ),
                                  RecipeDetailsNutritionValueItem(
                                    color: AppColors.goldenYellow,
                                    name: AppLocalizations.of(context)!.fat,
                                    value: AppLocalizations.of(context)!
                                        .grams(54.0),
                                  ),
                                  RecipeDetailsNutritionValueItem(
                                    color: AppColors.lightGreen,
                                    name: AppLocalizations.of(context)!.protein,
                                    value: AppLocalizations.of(context)!
                                        .grams(48.7),
                                  ),
                                  RecipeDetailsNutritionValueItem(
                                    color: AppColors.powder,
                                    name: AppLocalizations.of(context)!.garbs,
                                    value: AppLocalizations.of(context)!
                                        .grams(5.5),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Text('Description 4'),
                              Text('Description 4'),
                              Text('Description 4'),
                              Text('Description 4'),
                              Text('Description 4'),
                              Text('Description 4'),
                              SizedBox(height: 250),
                              Text('Description 4'),
                              Text('Description 4'),
                              Text('Description 4'),
                              Text('Description 4'),
                              Text('Description 4'),
                              Text('Description 4'),
                              Text('Description 4'),
                              Text('Description 4'),
                              Text('Description 4'),
                              SizedBox(height: 250),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              if (controller.isExpandedButtonVisible.value)
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.82,
                  child: const RecipeDetailsHiddingButton(),
                ),
            ],
          ),
        ),
      );
}
