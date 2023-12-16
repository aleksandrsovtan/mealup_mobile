import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/sign_up_screen_controller.dart';
import 'package:mealsup_mobile/presentation/errors.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/emoji.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_button.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_error_display.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_outline_button.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_text_field.dart';

class GenderScreen extends GetView<SignUpScreenController> {
  const GenderScreen({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
        () => Scaffold(
          body: SafeArea(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: FocusScope.of(context).unfocus,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 36),
                  Text(
                    AppLocalizations.of(context)!.whats_your_gender,
                    style: AppTextStyles.h1.copyWith(color: AppColors.black),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomOutlineButton(
                            color: controller.gender.value == AppEmoji.girl
                                ? AppColors.primaryColor
                                : null,
                            borderRadius: 32,
                            childPadding: 18,
                            onTap: () => controller.changeGender(AppEmoji.girl),
                            child: Text(
                              AppEmoji.girl,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.emoji,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomOutlineButton(
                            color: controller.gender.value == AppEmoji.boy
                                ? AppColors.primaryColor
                                : null,
                            borderRadius: 32,
                            childPadding: 18,
                            onTap: () => controller.changeGender(AppEmoji.boy),
                            child: Text(
                              AppEmoji.boy,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.emoji,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    onTap: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.info,
                            size: 16, color: AppColors.darkGray),
                        const SizedBox(width: 8),
                        Text(
                          AppLocalizations.of(context)!
                              .which_one_should_i_choose,
                          style: AppTextStyles.dmSans12
                              .copyWith(color: AppColors.darkGray),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 36),
                  Text(
                    AppLocalizations.of(context)!.how_old_are_you,
                    style: AppTextStyles.h1.copyWith(color: AppColors.black),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    borderColor: AppColors.transparent,
                    backgroundColor: AppColors.white,
                    textType: TextInputType.number,
                    maxLength: 2,
                    hintText: controller.age.isNotEmpty
                        ? controller.age.value
                        : AppLocalizations.of(context)!.age,
                    onChanged: controller.changeAge,
                  ),
                  const SizedBox(height: 24),
                  if (controller.genderError.isNotEmpty)
                    CustomErrorDisplay(
                        errorMessage: parseValidationError(
                            context, controller.genderError.value)!),
                  if (controller.ageError.isNotEmpty)
                    CustomErrorDisplay(
                        errorMessage: parseValidationError(
                            context, controller.ageError.value)!),
                  const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 16,
                        right: 16,
                        bottom: MediaQuery.of(context).viewInsets.bottom + 24),
                    child: CustomButton(
                      borderRadius: 32,
                      borderWidth: 2,
                      backgroundColor:
                          controller.gender.isEmpty || controller.age.isEmpty
                              ? AppColors.darkGray.withOpacity(0.7)
                              : AppColors.primaryColor,
                      borderColor: controller.gender.isNotEmpty &&
                              controller.age.isNotEmpty
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
