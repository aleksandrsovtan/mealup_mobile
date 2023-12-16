import 'package:flutter/material.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.borderColor,
    required this.backgroundColor,
    required this.hintText,
    this.hintTextColor,
    this.textAlign,
    this.onChanged,
    this.controller,
    this.textType,
    this.maxLength,
    this.contentPadding,
  });

  final Color borderColor;
  final Color backgroundColor;
  final String hintText;
  final Color? hintTextColor;
  final TextAlign? textAlign;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? textType;
  final int? maxLength;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(final BuildContext context) => Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        padding: const EdgeInsets.only(top: 9, bottom: 9),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor,
        ),
        child: TextField(
          maxLength: maxLength,
          keyboardType: textType,
          controller: controller,
          style: AppTextStyles.dmSans16.copyWith(color: AppColors.black),
          cursorWidth: 1,
          textAlign: textAlign ?? TextAlign.center,
          decoration: InputDecoration(
            counterText: '',
            contentPadding: contentPadding,
            focusedBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintText: hintText,
            hintStyle: AppTextStyles.dmSans16
                .copyWith(color: hintTextColor ?? AppColors.darkGray),
          ),
          onChanged: onChanged,
        ),
      );
}
