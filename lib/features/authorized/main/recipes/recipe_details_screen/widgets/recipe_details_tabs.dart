import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/recipe_details_screen/recipes_details_screen_controller.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';

class RecipeDetailsTabs extends GetView<RecipeDetailsScreenController> {
  const RecipeDetailsTabs({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
        () => Padding(
          padding: const EdgeInsets.only(top: 36),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  splashColor: AppColors.transparent,
                  highlightColor: AppColors.transparent,
                  onTap: () => controller.onPreparationsTabTapped(false),
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.ingredients,
                        style: AppTextStyles.dmSans16.copyWith(
                          color: controller.isPreparationsTab.value
                              ? AppColors.hintColor
                              : AppColors.primaryColor,
                          fontWeight: controller.isPreparationsTab.value
                              ? FontWeight.w400
                              : FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 2),
                        height: controller.isPreparationsTab.value ? 0.5 : 1,
                        color: controller.isPreparationsTab.value
                            ? AppColors.hintColor
                            : AppColors.primaryColor,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  splashColor: AppColors.transparent,
                  highlightColor: AppColors.transparent,
                  onTap: () => controller.onPreparationsTabTapped(true),
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.preparations,
                        style: AppTextStyles.dmSans16.copyWith(
                          color: controller.isPreparationsTab.value
                              ? AppColors.primaryColor
                              : AppColors.hintColor,
                          fontWeight: controller.isPreparationsTab.value
                              ? FontWeight.w500
                              : FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 2),
                        height: controller.isPreparationsTab.value ? 1 : 0.5,
                        color: controller.isPreparationsTab.value
                            ? AppColors.primaryColor
                            : AppColors.hintColor,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
