import 'package:flutter/material.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.child,
    this.height,
    this.width,
    this.borderRadius,
    this.borderWidth,
    this.borderColor,
    this.backgroundColor,
  });

  final VoidCallback onTap;
  final Widget child;
  final double? height;
  final double? width;
  final double? borderRadius;
  final double? borderWidth;
  final Color? borderColor;
  final Color? backgroundColor;

  @override
  Widget build(final BuildContext context) => InkWell(
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        onTap: onTap,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? AppColors.transparent,
              width: borderWidth ?? 0,
            ),
            borderRadius: BorderRadius.circular(borderRadius ?? 0.0),
            color: backgroundColor,
          ),
          child: child,
        ),
      );
}
