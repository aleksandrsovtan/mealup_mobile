import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/recipe_details_screen/recipes_details_screen_controller.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';

class RecipeDetailsHidingButton extends GetView<RecipeDetailsScreenController> {
  const RecipeDetailsHidingButton({super.key});

  @override
  Widget build(final BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onVerticalDragDown: (final details) =>
            controller.onExpandedButtonTapped(),
        child: Stack(
          children: [
            SizedBox(
              height: 45,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
              margin: EdgeInsets.only(
                top: 25,
                left: MediaQuery.of(context).size.width / 2 - 16,
              ),
              height: 5,
              width: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: AppColors.darkGray60,
              ),
            ),
          ],
        ),
      );
}
