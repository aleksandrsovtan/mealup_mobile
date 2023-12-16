import 'package:flutter/material.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';

class MealPlansScreen extends StatelessWidget {
  const MealPlansScreen({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: Center(
          child: Container(
            height: 100,
            width: 100,
            color: AppColors.red,
          ),
        ),
      );
}
