import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/unauthorized/welcome/welcome_screen_controller.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';
import 'package:mealsup_mobile/presentation/widgets/accept_terms.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_button.dart';
import 'package:mealsup_mobile/routes.dart';

class WelcomeScreen extends GetView<WelcomeScreenController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    Get.put<WelcomeScreenController>(WelcomeScreenController());
    return Obx(
      () => Scaffold(
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 24, left: 12),
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              color: AppColors.primaryColor,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                color: AppColors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      AppLocalizations.of(context)!.start_your_journey,
                      style: AppTextStyles.h1,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      AppLocalizations.of(context)!.app_discription,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.dmSans14w400.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Checkbox(
                          value: controller.isAgreed.value,
                          onChanged: (final value) =>
                              controller.changeaAgreement(value ?? false),
                          checkColor: AppColors.primaryColor,
                          side: BorderSide(
                            color: !controller.isAgreedEmpty.value
                                ? AppColors.darkGray60
                                : AppColors.redError,
                          ),
                        ),
                        AcceptTerms(
                          onTapPrivacyPolicy: () {
                            print('policy');
                          },
                          onTapTerms: () {
                            print('terms');
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CustomButton(
                        borderRadius: 32,
                        borderWidth: 2,
                        backgroundColor: AppColors.primaryColor,
                        onTap: () {
                          if (controller.isAgreed.isFalse) {
                            controller.changeaAreementIsEmpty(true);
                          } else {
                            Get.toNamed(Routes.signUpSteps);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(19),
                          child: Text(
                            AppLocalizations.of(context)!.lets_start,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.button
                                .copyWith(color: AppColors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.already_mealsup_user,
                          style: AppTextStyles.dmSans14w400,
                        ),
                        const SizedBox(width: 4),
                        InkWell(
                          onTap: () {
                            if (controller.isAgreed.isFalse) {
                              controller.changeaAreementIsEmpty(true);
                            } else {
                              Get.toNamed(Routes.signIn);
                            }
                          },
                          child: Text(
                            AppLocalizations.of(context)!.sign_in,
                            style: AppTextStyles.dmSans14.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
