import 'package:flutter/material.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({final Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          // child: Image.asset(imgAppLogo),
          child: Container(
            width: 100,
            height: 100,
            color: AppColors.primaryColor,
          ),
        ),
      );
}
