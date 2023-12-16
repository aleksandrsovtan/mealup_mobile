import 'package:flutter/material.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    super.key,
    required this.child,
    required this.onTap,
    this.color,
    this.childPadding,
    this.borderRadius,
  });

  final Widget child;
  final VoidCallback onTap;
  final double? childPadding;
  final Color? color;
  final double? borderRadius;

  @override
  Widget build(final BuildContext context) => InkWell(
        splashColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius ?? 0),
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(1.5),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(borderRadius ?? 0),
              ),
              child: Padding(
                padding: EdgeInsets.all(childPadding ?? 0),
                child: child,
              ),
            ),
          ),
        ),
      );
}
