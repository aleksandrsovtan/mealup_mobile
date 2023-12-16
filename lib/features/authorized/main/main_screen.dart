import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/authorized/main/main_screen_controller.dart';
import 'package:mealsup_mobile/routes.dart';

class MainScreen extends GetView<MainScreenController> {
  const MainScreen({super.key});

  @override
  Widget build(final BuildContext context) => Obx(
        () => Scaffold(
          body: Navigator(
            key: Get.nestedKey(0),
            initialRoute: Routes.recipes,
            onGenerateRoute: controller.onGenerateRoute,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.selectedIndex.value,
            onTap: controller.changeSelectedIndex,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: const Icon(Icons.book),
                label: AppLocalizations.of(context)!.recipes,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: AppLocalizations.of(context)!.meal_plans,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.restaurant),
                label: AppLocalizations.of(context)!.achievements,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.more_horiz),
                label: AppLocalizations.of(context)!.more,
              ),
            ],
          ),
        ),
      );

  // Widget _getBodyWidget(final int selectedIndex) {
  //   switch (selectedIndex) {
  //     case 0:
  //       return Container(color: Colors.amber);
  //     case 1:
  //       return const SizedBox.shrink();
  //     case 2:
  //       return const SizedBox.shrink();
  //     case 3:
  //       return const SizedBox.shrink();

  //     default:
  //       return const SizedBox.shrink();
  //   }
  // }
}

class Constants {
  static const nestedNavigationNavigatorId = 1;
}
