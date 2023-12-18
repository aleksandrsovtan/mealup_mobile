import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';

class RecipeFullDescription extends StatelessWidget {
  const RecipeFullDescription({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: Center(
          child: InkWell(
            onTap: Get.back,
            child: Container(
              color: AppColors.blue,
              height: 150,
              width: 150,
            ),
          ),
        ),
      );
}
