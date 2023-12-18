import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';
import 'package:mealsup_mobile/presentation/resources/icons.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    final Key? key,
    this.onTap,
    this.onChanged,
    required this.hintText,
    required this.readOnly,
  }) : super(key: key);

  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final String hintText;
  final bool readOnly;

  @override
  Widget build(final BuildContext context) => TextField(
        textCapitalization: TextCapitalization.sentences,
        readOnly: readOnly,
        style: AppTextStyles.dmSans14,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: AppColors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          hintText: hintText,
          hintStyle: AppTextStyles.dmSans16.copyWith(
            color: AppColors.hintColor,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              AppIcons.search,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                AppColors.hintColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        onChanged: onChanged,
      );
}
