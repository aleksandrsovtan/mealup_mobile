import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/recipe_details_screen/recipes_details_screen_controller.dart';
import 'package:mealsup_mobile/presentation/resources/icons.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_round_button.dart';

class RecipeDetailsButtonsRow extends GetView<RecipeDetailsScreenController> {
  const RecipeDetailsButtonsRow({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
        () => Row(
          children: [
            CustomRoundButton(
              iconSize: 20,
              iconPath: AppIcons.arrowBack,
              padding: const EdgeInsets.symmetric(
                horizontal: 9,
                vertical: 5,
              ),
              radius: 15,
              onTap: Get.back,
            ),
            const Spacer(),
            CustomRoundButton(
              iconSize: 20,
              iconPath: AppIcons.share,
              padding: const EdgeInsets.all(5),
              radius: 15,
              onTap: () {},
            ),
            const SizedBox(width: 10),
            CustomRoundButton(
              iconSize: 20,
              iconPath: controller.isLiked.value
                  ? AppIcons.favoriteFill
                  : AppIcons.favoriteBorder,
              padding: const EdgeInsets.all(5),
              radius: 15,
              onTap: controller.onLikeTapped,
            ),
          ],
        ),
      );
}
