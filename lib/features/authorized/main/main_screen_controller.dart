import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/features/authorized/main/achivements/achivements_screen.dart';
import 'package:mealsup_mobile/features/authorized/main/achivements/achivements_screen_bindings.dart';
import 'package:mealsup_mobile/features/authorized/main/meal_plans/meal_plans_screen.dart';
import 'package:mealsup_mobile/features/authorized/main/meal_plans/meal_plans_screen_bindings.dart';
import 'package:mealsup_mobile/features/authorized/main/more/more_screen.dart';
import 'package:mealsup_mobile/features/authorized/main/more/more_screen_bindings.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/recipes_screen.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/recipes_screen_bindings.dart';
import 'package:mealsup_mobile/routes.dart';

class MainScreenController extends GetxController {
  final RxInt selectedIndex = RxInt(0);

  void changeSelectedIndex(final int value) {
    selectedIndex.value = value;
    Get.toNamed(pages[value], id: 0);
  }

  final pages = <String>[
    Routes.recipes,
    Routes.mealPlans,
    Routes.achievements,
    Routes.more,
  ];

  Route? onGenerateRoute(final RouteSettings settings) {
    print(settings.name);
    switch (settings.name) {
      case Routes.recipes:
        return GetPageRoute(
            settings: settings,
            page: () => const RecipesScreen(),
            binding: RecipesScreenBindings(),
            transition: Transition.noTransition);
      case Routes.mealPlans:
        return GetPageRoute(
          settings: settings,
          page: () => const MealPlansScreen(),
          binding: MealPlansScreenBindings(),
          transition: Transition.noTransition,
        );
      case Routes.achievements:
        return GetPageRoute(
          settings: settings,
          page: () => const AchivementsScreen(),
          binding: AchivementsScreenBindings(),
          transition: Transition.noTransition,
        );
      case Routes.more:
        return GetPageRoute(
            settings: settings,
            page: () => const MoreScreen(),
            binding: MoreScreenBindings(),
            transition: Transition.noTransition);

      default:
        return GetPageRoute(
            settings: settings,
            page: () => const RecipesScreen(),
            binding: RecipesScreenBindings(),
            transition: Transition.noTransition);
    }
  }
}
