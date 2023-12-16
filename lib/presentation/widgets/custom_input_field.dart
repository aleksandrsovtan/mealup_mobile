import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    final Key? key,
    required this.labelText,
    this.initialValue,
    this.controller,
    this.focusNode,
    this.suffixIcon,
    this.maxLength = 64,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.errorText,
    this.errorMaxLines = 1,
    this.isPasswordVisible = false,
    this.readOnly = false,
    this.autofillHints,
    this.onTap,
    this.onChanged,
    this.onSubmitted,
    this.margin,
  }) : super(key: key);

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? initialValue;
  final String labelText;
  final String? errorText;
  final int? errorMaxLines;
  final bool isPasswordVisible;
  final int maxLength;
  final Widget? suffixIcon;
  final GestureTapCallback? onTap;
  final bool readOnly;
  final TextInputType keyboardType;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final TextInputAction? textInputAction;
  final Iterable<String>? autofillHints;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(final BuildContext context) => Container(
        margin: margin,
        child: TextFormField(
          initialValue: initialValue,
          controller: controller,
          focusNode: focusNode,
          readOnly: readOnly,
          autofillHints: autofillHints,
          onTap: onTap,
          textInputAction: textInputAction,
          onFieldSubmitted: (final _) {
            if (onSubmitted != null) {
              onSubmitted!(_);
            } else {
              if (textInputAction == TextInputAction.next) {
                FocusScope.of(context).nextFocus();
              } else {
                FocusScope.of(context).unfocus();
              }
            }
          },
          onChanged: onChanged,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
            filled: true,
            fillColor: AppColors.white,
            hintText: labelText,
            hintStyle: AppTextStyles.dmSans16.copyWith(
              color: AppColors.lightGray,
              fontWeight: FontWeight.w500,
            ),
            errorText: errorText,
            errorMaxLines: errorMaxLines,
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.redError,
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.transparent,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.redError,
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.transparent,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: AppColors.transparent,
                width: 2,
              ),
            ),
            suffixIcon: suffixIcon,
          ),
          keyboardType: keyboardType,
          maxLines: 1,
          inputFormatters: [LengthLimitingTextInputFormatter(maxLength)],
          autocorrect: false,
          style: AppTextStyles.dmSans16,
          cursorColor: AppColors.primaryColor,
          obscureText: suffixIcon == null ? false : !isPasswordVisible,
        ),
      );
}
