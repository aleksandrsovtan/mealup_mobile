import 'package:flutter/material.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';

class ArrowBackButton extends StatelessWidget {
  const ArrowBackButton({
    super.key,
    required this.onTap,
    this.size,
    this.color,
  });

  final VoidCallback onTap;
  final double? size;
  final Color? color;

  @override
  Widget build(final BuildContext context) => InkWell(
        onTap: onTap,
        child: Icon(
          Icons.arrow_back_ios,
          size: size ?? 24,
          color: color ?? AppColors.darkGray,
        ),
      );
}
