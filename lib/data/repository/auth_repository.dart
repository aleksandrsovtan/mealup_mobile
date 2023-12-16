import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/core/error/exceptions.dart';
import 'package:mealsup_mobile/data/datasource/auth_local_data_store.dart';
import 'package:mealsup_mobile/data/entity/user_entity.dart';
import 'package:mealsup_mobile/data/model/request/sign_in_model.dart';
import 'package:mealsup_mobile/data/model/request/sign_up_model.dart';
import 'package:mealsup_mobile/data/model/response/user_model.dart';
import 'package:mealsup_mobile/data/services/auth_service.dart';
import 'package:mealsup_mobile/main.dart';

class AuthRepository extends GetxService {
  AuthRepository();

  @override
  void onInit() {
    _loadUserFromCache();
    super.onInit();
  }

  final AuthLocalDataStore _authLocalDataStore = Get.find<AuthLocalDataStore>();
  final AuthService _authService = Get.find<AuthService>();
  final _userStreamController = StreamController<UserEntity?>.broadcast();

  UserEntity? _user;

  Future<void> _loadUserFromCache() async {
    final userModel = await _authLocalDataStore.getUserModel();
    if (userModel == null) {
      _user = null;
      _userStreamController.add(_user);
      return;
    }
    _user = UserEntity(
      id: userModel.id,
      email: userModel.email,
      name: userModel.name,
    );
    _userStreamController.add(_user);
  }

  Stream<UserEntity?> get currentUserStream async* {
    yield _user;
    yield* _userStreamController.stream;
  }

  Future<Either<BaseException, UserEntity>> signInWithEmailAndPassword(
      final String email, final String password) async {
    try {
      await _authService.signIn(SignInModel(email, password));
      final UserModel userModel = await _authService.getUserData(email);
      await _authLocalDataStore.storeUserModel(userModel);
      _user = UserEntity(
        id: userModel.id,
        email: userModel.email,
        name: userModel.name,
      );
      _userStreamController.add(_user);
      return Right(_user!);
    } on BaseException catch (e, stack) {
      await FirebaseCrashlytics.instance
          .recordError(e, stack, reason: 'signInWithEmailAndPassword');
      logger.e('signInWithEmailAndPassword', error: e, stackTrace: stack);
      return Left(parseException(e.cause, stack, 'SignIn failed'));
    }
  }

  Future<Either<BaseException, void>> signUp(
      final SignUpModel signUpModel) async {
    try {
      final signupResponse = await _authService.signUp(signUpModel);
      final UserModel userModel = UserModel(
        email: signupResponse.email,
        name: signupResponse.name,
        gender: signupResponse.gender,
        age: signupResponse.age,
        weightUnit: signupResponse.weightUnit,
        weight: signupResponse.weight,
        tallUnit: signupResponse.tallUnit,
        tall: signupResponse.tall,
        goal: signupResponse.goal,
        activity: signupResponse.activity,
        waterGoal: signupResponse.waterGoal,
        waterCount: signupResponse.waterCount,
      );
      await _authService.createUser(userModel);
      await _authLocalDataStore.storeUserModel(userModel);
      await _loadUserFromCache();
      return const Right(null);
    } on BaseException catch (e, stack) {
      await FirebaseCrashlytics.instance
          .recordError(e, stack, reason: 'signUp');
      logger.e('signUp', error: e, stackTrace: stack);
      return Left(parseException(e.cause, stack, 'Sign up failed'));
    }
  }

  Future<Either<BaseException, void>> resetPassword(final String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  Future<Either<BaseException, UserEntity>> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  Future<Either<BaseException, UserEntity>> signInWithApple() {
    // TODO: implement signInWithApple
    throw UnimplementedError();
  }

  Future<Either<BaseException, void>> logOut() async {
    try {
      await _authService.logOut();
      await _authLocalDataStore.clearCache();
      _userStreamController.add(_user = null);
      return const Right(null);
    } catch (e, stack) {
      await FirebaseCrashlytics.instance
          .recordError(e, stack, reason: 'logout');
      logger.e('logout', error: e, stackTrace: stack);
      return Left(parseException(e, stack, 'Logout failed'));
    }
  }

  Future<void> dispose() => _userStreamController.close();
}
