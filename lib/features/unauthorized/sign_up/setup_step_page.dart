import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/sign_up_screen_controller.dart';
import 'package:mealsup_mobile/presentation/widgets/arrow_back_button.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_progress_bar.dart';

class SetupStepPage extends GetView<SignUpScreenController> {
  const SetupStepPage({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
        () => Scaffold(
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 24, left: 16),
                    child: ArrowBackButton(
                      onTap: () => controller.step.value.index == 0
                          ? Get.back()
                          : controller.previusStep(controller.step.value),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CustomProgressBar(
                    value: MediaQuery.of(context).size.width *
                        controller.step.value.progressBarValue),
                Expanded(
                  child: PageTransitionSwitcher(
                      duration: const Duration(seconds: 1),
                      transitionBuilder: (
                        final Widget child,
                        final Animation<double> animation,
                        final Animation<double> secondaryAnimation,
                      ) =>
                          SharedAxisTransition(
                            animation: animation,
                            secondaryAnimation: secondaryAnimation,
                            transitionType: SharedAxisTransitionType.horizontal,
                            child: child,
                          ),
                      child: controller.step.value.screen),
                ),
              ],
            ),
          ),
        ),
      );
}
