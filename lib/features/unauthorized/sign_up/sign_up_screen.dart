import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/sign_up_screen_controller.dart';
import 'package:mealsup_mobile/presentation/errors.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';
import 'package:mealsup_mobile/presentation/resources/images.dart';
import 'package:mealsup_mobile/presentation/widgets/arrow_back_button.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_button.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_error_display.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_input_field.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_password_input_field.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_social_button.dart';

class SignUpScreen extends GetView<SignUpScreenController> {
  const SignUpScreen({super.key});

  @override
  Widget build(final BuildContext context) => PopScope(
        canPop: true,
        onPopInvoked: (final bool didPop) async {
          controller.clearErrors();
        },
        child: Scaffold(
          body: Obx(
            () {
              if (controller.error.value != null) {
                SchedulerBinding.instance
                    .addPostFrameCallback((final timeStamp) {
                  controller.scrollController.animateTo(
                    controller.scrollController.position.maxScrollExtent,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 500),
                  );
                });
              }
              return LayoutBuilder(
                builder: (final context, final constraints) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: MediaQuery.of(context).padding.top),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 16),
                            ArrowBackButton(onTap: Get.back),
                            Expanded(
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)!.sign_up,
                                  style: AppTextStyles.h1
                                      .copyWith(color: AppColors.black),
                                ),
                              ),
                            ),
                            const SizedBox(width: 36),
                          ],
                        ),
                        const SizedBox(height: 36),
                        Center(
                          child: Text(
                            AppLocalizations.of(context)!
                                .lets_save_your_progress,
                            style: AppTextStyles.h1,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Center(
                          child: Text(
                            AppLocalizations.of(context)!.sign_up_to_save,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.dmSans16
                                .copyWith(color: AppColors.darkGray),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Obx(
                          () => CustomInputField(
                            key: const Key('email'),
                            initialValue: controller.email.value,
                            labelText:
                                AppLocalizations.of(context)!.email_address,
                            errorText: parseValidationError(
                              context,
                              controller.emailError.value,
                            ),
                            textInputAction: TextInputAction.next,
                            autofillHints: const <String>[
                              AutofillHints.email,
                            ],
                            keyboardType: TextInputType.emailAddress,
                            onChanged: controller.changeEmail,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Obx(
                          () => CustomPasswordInputField(
                            key: const Key('password'),
                            initialValue: controller.password.value,
                            labelText: AppLocalizations.of(context)!.password,
                            errorText: parseValidationError(
                              context,
                              controller.passwordError.value,
                            ),
                            isPasswordVisible:
                                controller.isPasswordVisible.value,
                            textInputAction: TextInputAction.next,
                            autofillHints: const <String>[
                              AutofillHints.password,
                            ],
                            onChanged: controller.changePassword,
                            onPasswordVisibilityChanged:
                                controller.passwordVisibilityChanged,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Obx(
                          () => CustomPasswordInputField(
                            key: const Key('repeat_password'),
                            initialValue: controller.repeatPassword.value,
                            labelText: 'repeat_password',
                            errorText: parseValidationError(
                              context,
                              controller.repeatPasswordError.value,
                            ),
                            isPasswordVisible:
                                controller.isRepeatPasswordVisible.value,
                            textInputAction: TextInputAction.done,
                            onSubmitted: (final _) {
                              FocusScope.of(context).unfocus();
                              controller.signUp();
                            },
                            onChanged: controller.onRepeatPasswordChanged,
                            onPasswordVisibilityChanged:
                                controller.onRepeatPasswordVisibilityChanged,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          AppLocalizations.of(context)!.characters_minimum,
                          style: AppTextStyles.dmSans12
                              .copyWith(color: AppColors.darkGray),
                        ),
                        const SizedBox(height: 48),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 24,
                                height: 1,
                                color: AppColors.darkGray),
                            const SizedBox(width: 18),
                            Text(
                              AppLocalizations.of(context)!.or_continue_with,
                              style: AppTextStyles.dmSans12
                                  .copyWith(color: AppColors.darkGray),
                            ),
                            const SizedBox(width: 18),
                            Container(
                                width: 24,
                                height: 1,
                                color: AppColors.darkGray),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: CustomSocialButton(
                                  socialImage: AppImages.iconGoogle2x,
                                  onTap: () {
                                    print('Google');
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: CustomSocialButton(
                                  socialImage: AppImages.iconApple2x,
                                  onTap: () {
                                    print('Apple');
                                  },
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: CustomSocialButton(
                                  socialImage: AppImages.iconFacebook2x,
                                  onTap: () {
                                    print('Facebook');
                                  },
                                ),
                              ),
                            ]),
                        const SizedBox(height: 110),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: controller.isLoading.value
                              ? const SizedBox(
                                  height: 48,
                                  child: Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              : Obx(
                                  () => CustomButton(
                                    key: const Key('signup_button'),
                                    borderRadius: 32,
                                    borderWidth: 2,
                                    backgroundColor:
                                        controller.email.isNotEmpty &&
                                                controller
                                                    .password.isNotEmpty &&
                                                controller.repeatPassword
                                                    .isNotEmpty &&
                                                controller.emailError.isEmpty &&
                                                controller
                                                    .passwordError.isEmpty &&
                                                controller.repeatPasswordError
                                                    .isEmpty &&
                                                controller.error.value == null
                                            ? AppColors.primaryColor
                                            : AppColors.darkGray
                                                .withOpacity(0.7),
                                    onTap: () {
                                      FocusScope.of(context).unfocus();
                                      controller.signUp();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(18),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .sign_up
                                            .toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: AppTextStyles.button
                                            .copyWith(color: AppColors.white),
                                      ),
                                    ),
                                  ),
                                ),
                        ),
                        const SizedBox(height: 24),
                        if (controller.socialError.isNotEmpty)
                          CustomErrorDisplay(
                              errorMessage: parseSocialError(
                                  context, controller.socialError.value)!),
                        if (controller.error.value != null)
                          CustomErrorDisplay(
                            errorMessage: controller.error.value.message,
                          ),
                        const SizedBox(height: 64),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
}
