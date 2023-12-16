import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/sign_up_screen_controller.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_button.dart';
import 'package:mealsup_mobile/routes.dart';

class CalorieResultScreen extends GetView<SignUpScreenController> {
  const CalorieResultScreen({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 24),
              const Text('Your recommended daily calorie intake'),
              const Spacer(),
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
                    Get.toNamed(Routes.signUp);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Text(
                      AppLocalizations.of(context)!.sign_up.toUpperCase(),
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
