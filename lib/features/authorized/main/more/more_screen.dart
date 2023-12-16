import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mealsup_mobile/data/repository/auth_repository.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
      body: Center(
          child: InkWell(
              onTap: () {
                Get.find<AuthRepository>().logOut();
              },
              child: const Text('Sign out'))));
}
