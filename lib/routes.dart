import 'package:get/get.dart';
import 'package:mealsup_mobile/features/authorized/main/main_screen.dart';
import 'package:mealsup_mobile/features/authorized/main/main_screen_bindings.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/recipe_details_screen/recipes_details_screen.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/recipe_details_screen/recipes_details_screen_bindings.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_in/sign_in_screen.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_in/sign_in_screen_bindings.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/setup_step_page.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/sign_up_screen.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/sign_up_screen_bindings.dart';
import 'package:mealsup_mobile/features/unauthorized/splash/splash_screen.dart';
import 'package:mealsup_mobile/features/unauthorized/welcome/welcome_bindings.dart';
import 'package:mealsup_mobile/features/unauthorized/welcome/welcome_screen.dart';

class GetPages {
  static List<GetPage> allGetPages() => [
        GetPage(
          name: Routes.splash,
          page: () => const SplashScreen(),
          // binding: SplashScreenBindings(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: Routes.welcome,
          page: () => const WelcomeScreen(),
          binding: WelcomeScreenBindings(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: Routes.signIn,
          page: () => const SignInScreen(),
          binding: SignInScreenBindings(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: Routes.signUp,
          page: () => const SignUpScreen(),
          binding: SignUpScreenBindings(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: Routes.signUpSteps,
          page: () => const SetupStepPage(),
          binding: SignUpScreenBindings(),
          transition: Transition.rightToLeft,
        ),
        GetPage(
          name: Routes.main,
          page: () => const MainScreen(),
          binding: MainScreenBindings(),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: Routes.recipeFullDescription,
          binding: RecipeDetailsScreenBindings(),
          page: () => const RecipeDetailsScreen(),
          transition: Transition.downToUp,
        ),
      ];
}

class Routes {
  static const splash = '/splash';

  // AUTHORIZATION
  static const welcome = '/welcome';
  static const signIn = '/sign-in';
  static const signUp = '/sign-up';
  static const signUpSteps = '/sign-upsteps';

  // HOME
  static const main = '/main';
  static const recipes = '/recipes';
  static const mealPlans = '/meal-plans';
  static const achievements = '/achievements';
  static const more = '/more';
  static const recipeFullDescription = '/recipe-full-description';
}
