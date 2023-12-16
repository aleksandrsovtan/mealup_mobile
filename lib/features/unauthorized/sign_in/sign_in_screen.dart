import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_in/sign_in_screen_controller.dart';
import 'package:mealsup_mobile/presentation/errors.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/emoji.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';
import 'package:mealsup_mobile/presentation/resources/images.dart';
import 'package:mealsup_mobile/presentation/widgets/arrow_back_button.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_button.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_error_display.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_input_field.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_password_input_field.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_social_button.dart';

class SignInScreen extends GetView<SignInScreenController> {
  const SignInScreen({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
        () => Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 16),
                    ArrowBackButton(onTap: Get.back),
                    Expanded(
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.sign_in,
                          style:
                              AppTextStyles.h1.copyWith(color: AppColors.black),
                        ),
                      ),
                    ),
                    const SizedBox(width: 36),
                  ],
                ),
                const SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppEmoji.hello,
                      style: AppTextStyles.h1,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      AppLocalizations.of(context)!.good_to_see_you_again,
                      style: AppTextStyles.h1,
                    )
                  ],
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 12),
                CustomInputField(
                  key: const Key('email'),
                  initialValue: controller.email.value,
                  labelText: AppLocalizations.of(context)!.email_address,
                  errorText: parseValidationError(
                      context, controller.emailError.value),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: const [AutofillHints.email],
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  onChanged: controller.changeEmail,
                ),
                const SizedBox(height: 24),
                CustomPasswordInputField(
                  key: const Key('password'),
                  initialValue: controller.password.value,
                  labelText: AppLocalizations.of(context)!.password,
                  errorText: parseValidationError(
                      context, controller.passwordError.value),
                  textInputAction: TextInputAction.done,
                  isPasswordVisible: controller.isPasswordVisible.value,
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  autofillHints: const <String>[AutofillHints.password],
                  onSubmitted: (final _) {
                    FocusScope.of(context).unfocus();
                    controller.signIn();
                  },
                  onChanged: controller.changePassword,
                  onPasswordVisibilityChanged:
                      controller.passwordVisibilityChanged,
                ),
                const SizedBox(height: 10),
                if (controller.socialError.isNotEmpty)
                  CustomErrorDisplay(
                      errorMessage: parseSocialError(
                          context, controller.socialError.value)!),
                if (controller.error.value != null)
                  CustomErrorDisplay(
                      errorMessage: controller.error.value!.message),
                const SizedBox(height: 10),
                InkWell(
                  child: Text(
                    AppLocalizations.of(context)!.forgot_password,
                    style: AppTextStyles.dmSans14
                        .copyWith(color: AppColors.primaryColor),
                  ),
                  onTap: () {
                    print('forgot tapped');
                  },
                ),
                const SizedBox(height: 92),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(width: 24, height: 1, color: AppColors.darkGray),
                    const SizedBox(width: 18),
                    Text(
                      AppLocalizations.of(context)!.or_continue_with,
                      style: AppTextStyles.dmSans12
                          .copyWith(color: AppColors.darkGray),
                    ),
                    const SizedBox(width: 18),
                    Container(width: 24, height: 1, color: AppColors.darkGray),
                  ],
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
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
                ),
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
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CustomButton(
                            key: const Key('signin_button'),
                            borderRadius: 32,
                            borderWidth: 2,
                            backgroundColor: controller.email.isNotEmpty &&
                                    controller.password.isNotEmpty &&
                                    controller.emailError.isEmpty &&
                                    controller.passwordError.isEmpty &&
                                    controller.error.value == null
                                ? AppColors.primaryColor
                                : AppColors.darkGray.withOpacity(0.7),
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              controller.signIn();
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(18),
                              child: Text(
                                AppLocalizations.of(context)!
                                    .sign_in
                                    .toUpperCase(),
                                textAlign: TextAlign.center,
                                style: AppTextStyles.button
                                    .copyWith(color: AppColors.white),
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      );
}
