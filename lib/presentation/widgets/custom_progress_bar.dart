import 'package:flutter/material.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Stack(
          children: [
            Container(
              height: 6,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.transparent),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            Container(
              height: 6,
              width: value,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                border: Border.all(color: AppColors.transparent),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ],
        ),
      );
}
