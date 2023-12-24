import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';

class CustomRoundButton extends StatelessWidget {
  const CustomRoundButton({
    super.key,
    required this.iconSize,
    required this.iconPath,
    required this.padding,
    required this.radius,
    required this.onTap,
  });

  final String iconPath;
  final double iconSize;
  final EdgeInsetsGeometry padding;
  final double radius;
  final VoidCallback onTap;

  @override
  Widget build(final BuildContext context) => InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(radius),
          ),
          child: Padding(
            padding: padding,
            child: SvgPicture.asset(
              iconPath,
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
              height: iconSize,
              width: iconSize,
            ),
          ),
        ),
      );
}
