import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/sign_up_screen_controller.dart';
import 'package:mealsup_mobile/presentation/errors.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_button.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_error_display.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_text_field.dart';

class NameScreen extends GetView<SignUpScreenController> {
  const NameScreen({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
        () => Scaffold(
          body: SafeArea(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: FocusScope.of(context).unfocus,
              child: Column(
                children: [
                  const SizedBox(height: 36),
                  Text(AppLocalizations.of(context)!.whats_your_name,
                      style: AppTextStyles.h1.copyWith(color: AppColors.black)),
                  const SizedBox(height: 24),
                  CustomTextField(
                    borderColor: AppColors.transparent,
                    backgroundColor: AppColors.white,
                    hintText: controller.name.isNotEmpty
                        ? controller.name.value
                        : AppLocalizations.of(context)!.enter_your_name,
                    onChanged: (final value) =>
                        controller.changeNameValue(value),
                  ),
                  const SizedBox(height: 24),
                  if (controller.nameError.isNotEmpty)
                    CustomErrorDisplay(
                        errorMessage: parseValidationError(
                            context, controller.nameError.value)!),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: MediaQuery.of(context).viewInsets.bottom + 24),
                    child: CustomButton(
                      borderRadius: 32,
                      borderWidth: 2,
                      backgroundColor: controller.name.isEmpty
                          ? AppColors.darkGray.withOpacity(0.7)
                          : AppColors.primaryColor,
                      borderColor: controller.name.isNotEmpty
                          ? AppColors.primaryColor
                          : AppColors.transparent,
                      onTap: () {
                        controller.nextStep(controller.step.value);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Text(
                          AppLocalizations.of(context)!.next.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: AppTextStyles.button
                              .copyWith(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
