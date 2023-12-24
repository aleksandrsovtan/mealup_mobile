import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/recipe_details_screen/recipes_details_screen_controller.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';
import 'package:mealsup_mobile/presentation/resources/icons.dart';
import 'package:mealsup_mobile/presentation/utils/helper.dart';

class RecipeDetailsRatingAndTime
    extends GetView<RecipeDetailsScreenController> {
  const RecipeDetailsRatingAndTime({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
        () => Row(
          children: [
            Text(
              '${controller.rating.value}',
              style:
                  AppTextStyles.dmSans16.copyWith(color: AppColors.titleColor),
            ),
            const SizedBox(width: 8),
            RatingBar.builder(
              ignoreGestures: true,
              initialRating: controller.rating.value,
              itemSize: 16,
              itemBuilder: (final BuildContext context, final int index) =>
                  SvgPicture.asset(
                AppIcons.star,
                colorFilter: const ColorFilter.mode(
                  AppColors.goldenYellow,
                  BlendMode.srcIn,
                ),
              ),
              allowHalfRating: true,
              onRatingUpdate: controller.onRatingUpdate,
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 6,
              ),
              decoration: BoxDecoration(
                color: AppColors.backgroundColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                Helper.formatPreparationTime(
                  context,
                  controller.recipe.preparationTime,
                ),
                style: AppTextStyles.dmSans16
                    .copyWith(color: AppColors.titleColor),
              ),
            )
          ],
        ),
      );
}
