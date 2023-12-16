import 'package:flutter/material.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';

class CustomSocialButton extends StatelessWidget {
  const CustomSocialButton({
    super.key,
    required this.socialImage,
    required this.onTap,
  });

  final String socialImage;
  final VoidCallback onTap;

  @override
  Widget build(final BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: AppColors.white,
          ),
          child: Image.asset(socialImage),
        ),
      );
}
