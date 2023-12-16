import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/sign_up_screen_controller.dart';
import 'package:mealsup_mobile/presentation/errors.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_button.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_error_display.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_sliding_segmented_control.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_text_field.dart';

class ParameteresScreen extends GetView<SignUpScreenController> {
  const ParameteresScreen({super.key});

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
                    AppLocalizations.of(context)!.what_your_weight,
                    style: AppTextStyles.h1.copyWith(color: AppColors.black),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomSlidingSegmentedControl(
                        initialValue: controller.unitOfWeight.value,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        thumbDecoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        height: 24,
                        isStretch: true,
                        children: {
                          UnitOfWeight.ib: Text(
                            AppLocalizations.of(context)!.ib,
                            style:
                                controller.unitOfWeight.value == UnitOfWeight.ib
                                    ? AppTextStyles.dmSans16
                                        .copyWith(color: AppColors.white)
                                    : null,
                          ),
                          UnitOfWeight.kg: Text(
                            AppLocalizations.of(context)!.kg,
                            style:
                                controller.unitOfWeight.value == UnitOfWeight.kg
                                    ? AppTextStyles.dmSans16
                                        .copyWith(color: AppColors.white)
                                    : null,
                          ),
                        },
                        onValueChanged: (final value) {
                          controller.changeUnitOfWeight(value);
                        }),
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    maxLength: 3,
                    textType: TextInputType.number,
                    borderColor: AppColors.white,
                    backgroundColor: AppColors.white,
                    hintText: controller.weight.isEmpty
                        ? AppLocalizations.of(context)!.your_weight
                        : controller.weight.value,
                    onChanged: (final value) => controller.changeWeight(value),
                  ),
                  const SizedBox(height: 36),
                  Text(
                    AppLocalizations.of(context)!.how_tall_are_you,
                    style: AppTextStyles.h1.copyWith(color: AppColors.black),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: CustomSlidingSegmentedControl(
                        initialValue: controller.unitOfTall.value,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        thumbDecoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        height: 24,
                        isStretch: true,
                        children: {
                          UnitOfTall.cm: Text(
                            AppLocalizations.of(context)!.cm,
                            style: controller.unitOfTall.value == UnitOfTall.cm
                                ? AppTextStyles.dmSans16
                                    .copyWith(color: AppColors.white)
                                : null,
                          ),
                          UnitOfTall.ft: Text(
                            AppLocalizations.of(context)!.ftin,
                            style: controller.unitOfTall.value == UnitOfTall.ft
                                ? AppTextStyles.dmSans16
                                    .copyWith(color: AppColors.white)
                                : null,
                          ),
                        },
                        onValueChanged: (final value) {
                          controller.changeUnitOfTall(value);
                        }),
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(
                    maxLength: 3,
                    textType: TextInputType.number,
                    borderColor: AppColors.white,
                    backgroundColor: AppColors.white,
                    hintText: controller.tall.isEmpty
                        ? AppLocalizations.of(context)!.your_tall
                        : controller.tall.value,
                    onChanged: (final value) => controller.changeTall(value),
                  ),
                  const SizedBox(height: 24),
                  if (controller.weightError.isNotEmpty)
                    CustomErrorDisplay(
                        errorMessage: parseValidationError(
                            context, controller.weightError.value)!),
                  if (controller.tallError.isNotEmpty)
                    CustomErrorDisplay(
                        errorMessage: parseValidationError(
                            context, controller.tallError.value)!),
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
                          controller.weight.isEmpty || controller.tall.isEmpty
                              ? AppColors.darkGray.withOpacity(0.7)
                              : AppColors.primaryColor,
                      borderColor: controller.weight.isNotEmpty &&
                              controller.tall.isNotEmpty
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
