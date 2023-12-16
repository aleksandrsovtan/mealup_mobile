import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';
import 'package:mealsup_mobile/presentation/resources/icons.dart';

class RecipesLargeCard extends StatelessWidget {
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
  Widget build(final BuildContext context) => Container(
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
                      imageBuilder: (final context, final imageProvider) =>
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
                    '$caloriesCount kcal',
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
                    '$preparationTime min',
                    style: AppTextStyles.dmSans12.copyWith(
                      color: AppColors.hintColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
