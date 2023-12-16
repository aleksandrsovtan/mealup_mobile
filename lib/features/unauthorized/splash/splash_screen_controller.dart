import 'dart:async';

import 'package:get/get.dart';
import 'package:mealsup_mobile/data/entity/user_entity.dart';
import 'package:mealsup_mobile/data/repository/auth_repository.dart';
import 'package:mealsup_mobile/routes.dart';

final AuthRepository _authRepository = Get.find<AuthRepository>();
late StreamSubscription<UserEntity?> _authStreamSubscription;
late Stream<UserEntity?> _userStream;

class SplashScreenController extends GetxController {
  @override
  Future<void> onReady() async {
    super.onReady();
    await Future.delayed(const Duration(seconds: 3));
    _subscribeToAuthChanges();
  }

  void _subscribeToAuthChanges() {
    _userStream = _authRepository.currentUserStream;
    _authStreamSubscription =
        _userStream.distinct().listen((final UserEntity? user) async {
      if (user == null) {
        await Get.offAllNamed(Routes.welcome);
      } else {
        await Get.offAllNamed(Routes.main);
      }
    });
  }

  @override
  Future<void> onClose() async {
    await _authRepository.dispose();
    await _authStreamSubscription.cancel();
    super.onClose();
  }
}
