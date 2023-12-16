import 'package:flutter/material.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_input_field.dart';

class CustomPasswordInputField extends StatelessWidget {
  const CustomPasswordInputField({
    final Key? key,
    required this.labelText,
    this.initialValue,
    this.controller,
    this.focusNode,
    this.errorText,
    this.errorMaxLines = 3,
    this.isPasswordVisible = false,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
    this.onChanged,
    this.onPasswordVisibilityChanged,
    this.autofillHints,
    this.margin,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? initialValue;
  final FocusNode? focusNode;
  final String labelText;
  final String? errorText;
  final int? errorMaxLines;
  final bool isPasswordVisible;
  final TextInputAction textInputAction;
  final Iterable<String>? autofillHints;
  final ValueChanged<String>? onSubmitted;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onPasswordVisibilityChanged;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(final BuildContext context) => CustomInputField(
        controller: controller,
        initialValue: initialValue,
        focusNode: focusNode,
        textInputAction: textInputAction,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        labelText: labelText,
        errorText: errorText,
        errorMaxLines: errorMaxLines,
        autofillHints: autofillHints,
        isPasswordVisible: isPasswordVisible,
        margin: margin,
        suffixIcon: _PasswordVisibilityWidget(
          changeAction: onPasswordVisibilityChanged,
          passwordVisible: isPasswordVisible,
        ),
        keyboardType: TextInputType.text,
        maxLength: 32,
      );
}

class _PasswordVisibilityWidget extends StatelessWidget {
  const _PasswordVisibilityWidget({
    this.passwordVisible = false,
    required this.changeAction,
  });

  final bool passwordVisible;
  final VoidCallback? changeAction;

  @override
  Widget build(final BuildContext context) => IconButton(
        color: AppColors.darkGray60,
        splashColor: AppColors.transparent,
        onPressed: changeAction,
        icon: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: passwordVisible
              ? const Icon(
                  Icons.visibility_outlined,
                  key: Key('open_eye'),
                )
              : const Icon(
                  Icons.visibility_off_outlined,
                  key: Key('close_eye'),
                ),
        ),
      );
}
