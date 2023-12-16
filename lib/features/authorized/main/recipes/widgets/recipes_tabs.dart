import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/recipes_screen_controller.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';

class RecipesTabs extends GetView<RecipesScreenController> {
  const RecipesTabs({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
        () => Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  splashColor: AppColors.transparent,
                  highlightColor: AppColors.transparent,
                  onTap: () => controller.onFavoriteTapped(false),
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.discover,
                        style: AppTextStyles.dmSans16.copyWith(
                          color: controller.isFavorite.value
                              ? AppColors.hintColor
                              : AppColors.primaryColor,
                          fontWeight: controller.isFavorite.value
                              ? FontWeight.w400
                              : FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 2),
                        height: controller.isFavorite.value ? 0.5 : 1,
                        color: controller.isFavorite.value
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
                  onTap: () => controller.onFavoriteTapped(true),
                  child: Column(
                    children: [
                      Text(
                        AppLocalizations.of(context)!.favourite,
                        style: AppTextStyles.dmSans16.copyWith(
                          color: controller.isFavorite.value
                              ? AppColors.primaryColor
                              : AppColors.hintColor,
                          fontWeight: controller.isFavorite.value
                              ? FontWeight.w600
                              : FontWeight.w400,
                          fontSize: 17,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 2),
                        height: controller.isFavorite.value ? 1 : 0.5,
                        color: controller.isFavorite.value
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
