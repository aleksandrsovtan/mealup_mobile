import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/recipes_screen_controller.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';
import 'package:mealsup_mobile/presentation/resources/icons.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_like_button.dart';
import 'package:mealsup_mobile/routes.dart';

class RecipesLargeCard extends GetView<RecipesScreenController> {
  const RecipesLargeCard({
    super.key,
    this.recipeImage,
    required this.recipeName,
    required this.caloriesCount,
    required this.preparationTime,
  });

  final String? recipeImage;
  final String recipeName;
  final int caloriesCount;
  final int preparationTime;

  @override
  Widget build(final BuildContext context) => Obx(
        () => Stack(
          children: [
            InkWell(
              onTap: () => Get.toNamed(Routes.recipeFullDescription),
              child: Container(
                height: 235,
                width: 225,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.white,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                      child: recipeImage != null && recipeImage!.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: recipeImage ?? '',
                              fit: BoxFit.cover,
                              imageBuilder:
                                  (final context, final imageProvider) =>
                                      Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover),
                                ),
                              ),
                            )
                          : Container(
                              decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                              ),
                            ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                        child: Text(
                          recipeName,
                          style: AppTextStyles.dmSans14
                              .copyWith(fontWeight: FontWeight.w600),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12, bottom: 12),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.fire,
                            width: 12,
                            height: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            AppLocalizations.of(context)!
                                .calories_count(caloriesCount),
                            style: AppTextStyles.dmSans12.copyWith(
                              color: AppColors.hintColor,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(width: 16),
                          SvgPicture.asset(
                            AppIcons.accessTime,
                            width: 12,
                            height: 12,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            AppLocalizations.of(context)!
                                .minutes_count(preparationTime),
                            style: AppTextStyles.dmSans12.copyWith(
                              color: AppColors.hintColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 8,
              top: 8,
              child: CustomLikeButton(
                isFavorite: controller.isLiked.value,
                onTap: controller.onLikeTapped,
              ),
            ),
          ],
        ),
      );
}
