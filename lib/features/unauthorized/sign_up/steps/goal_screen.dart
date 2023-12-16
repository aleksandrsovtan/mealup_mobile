import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/enum_extension/goals.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/sign_up_screen_controller.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_button.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_outline_button.dart';

class GoalScreen extends GetView<SignUpScreenController> {
  const GoalScreen({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 36),
              Text(
                AppLocalizations.of(context)!.whats_your_goal,
                style: AppTextStyles.h1.copyWith(color: AppColors.black),
              ),
              const SizedBox(height: 24),
              ListView.builder(
                itemCount: Goal.values.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (final context, final index) => Padding(
                  padding: const EdgeInsets.only(top: 12, left: 26, right: 22),
                  child: Obx(
                    () => CustomOutlineButton(
                      color: Goal.values[index] == controller.goal.value
                          ? AppColors.primaryColor
                          : null,
                      borderRadius: 32,
                      childPadding: 18,
                      onTap: () {
                        controller.changeGoal(Goal.values[index]);
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                                GoalsExtension(Goal.values[index])
                                    .getIconValue(context),
                                textAlign: TextAlign.center,
                                style: AppTextStyles.emoji),
                          ),
                          Text(
                            GoalsExtension(Goal.values[index])
                                .getStringValue(context),
                            style: AppTextStyles.h3
                                .copyWith(color: AppColors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Text(
                  AppLocalizations.of(context)!.why_we_use_info,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.dmSans12
                      .copyWith(color: AppColors.darkGray),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    bottom: MediaQuery.of(context).viewInsets.bottom + 24),
                child: CustomButton(
                  borderRadius: 32,
                  borderWidth: 2,
                  backgroundColor: AppColors.primaryColor,
                  borderColor: AppColors.primaryColor,
                  onTap: () {
                    controller.nextStep(controller.step.value);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      AppLocalizations.of(context)!.next.toUpperCase(),
                      textAlign: TextAlign.center,
                      style:
                          AppTextStyles.button.copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
