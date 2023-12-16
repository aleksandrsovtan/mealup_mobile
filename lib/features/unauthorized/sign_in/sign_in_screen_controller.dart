import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/core/error/exceptions.dart';
import 'package:mealsup_mobile/data/repository/auth_repository.dart';
import 'package:mealsup_mobile/presentation/errors.dart';
import 'package:mealsup_mobile/presentation/utils/validator.dart';

class SignInScreenController extends GetxController {
  final AuthRepository _authRepository = Get.find<AuthRepository>();
  final RxBool isPasswordVisible = RxBool(false);
  final RxString email = RxString('');
  final RxString emailError = RxString('');
  final RxString password = RxString('');
  final RxString passwordError = RxString('');
  final RxBool isLoading = RxBool(false);
  final Rx<BaseException?> error = Rx<BaseException?>(null);
  final RxString socialError = RxString('');

  bool _validateFields() {
    if (Validator.isEmpty(email.value)) {
      emailError.value = emptyEmailError;
      return false;
    }
    if (!Validator.isEmailCorrect(email.value)) {
      emailError.value = invalidEmailError;
      return false;
    }
    if (Validator.isEmpty(password.value)) {
      passwordError.value = emptyPasswordError;
      return false;
    }
    if (!Validator.isPasswordCorrect(password.value)) {
      if (!Validator.hasCorrectLengthDigits(password.value)) {
        passwordError.value = wrongLengthPasswordError;
        return false;
      } else if (!Validator.containsUpperCaseSymbol(password.value)) {
        passwordError.value = upperCaseMissingPasswordError;
        return false;
      } else if (!Validator.containsLowerCaseSymbol(password.value)) {
        passwordError.value = lowerCaseMissingPasswordError;
        return false;
      } else if (!Validator.containsDigits(password.value)) {
        passwordError.value = digitsMissingPasswordError;
        return false;
      } else {
        passwordError.value = invalidPasswordError;
        return false;
      }
    }
    return true;
  }

  void passwordVisibilityChanged() => isPasswordVisible.toggle();

  void changeEmail(final String value) {
    error.value = null;
    emailError.value = '';
    email.value = value;
  }

  void changePassword(final String value) {
    error.value = null;
    passwordError.value = '';
    password.value = value;
  }

  Future<void> signIn() async {
    final valid = _validateFields();
    if (!valid) return;

    isLoading.value = true;

    Future<Either<BaseException, void>> callSignIn() =>
        _authRepository.signInWithEmailAndPassword(email.value, password.value);

    final signInResult = await callSignIn();

    signInResult.fold(
      (final l) {
        error.value = l;
        isLoading.value = false;
      },
      (final r) => isLoading.value = false,
    );
  }
}
