import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/core/error/exceptions.dart';
import 'package:mealsup_mobile/data/model/request/sign_up_model.dart';
import 'package:mealsup_mobile/data/repository/auth_repository.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/enum_extension/activity.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/enum_extension/goals.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/steps/activity_level_screen.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/steps/calorie_result_screen.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/steps/gender_screen.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/steps/goal_screen.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/steps/name_screen.dart';
import 'package:mealsup_mobile/features/unauthorized/sign_up/steps/parameters_screen.dart';
import 'package:mealsup_mobile/presentation/errors.dart';
import 'package:mealsup_mobile/presentation/utils/validator.dart';

enum SetupStep {
  name(NameScreen(), 0.17),
  gender(GenderScreen(), 0.33),
  parameters(ParameteresScreen(), 0.50),
  goal(GoalScreen(), 0.66),
  activityLevel(ActivityLevelScreen(), 0.83),
  calorieResult(CalorieResultScreen(), 1);

  const SetupStep(
    this.screen,
    this.progressBarValue,
  );

  final Widget screen;
  final double progressBarValue;
}

enum UnitOfWeight { ib, kg }

enum UnitOfTall { cm, ft }

class SignUpScreenController extends GetxController {
  final ScrollController scrollController = ScrollController();
  final AuthRepository _authRepository = Get.find<AuthRepository>();
  final RxBool isLoading = RxBool(false);
  final Rx<SetupStep> step = Rx<SetupStep>(SetupStep.name);
  final RxString name = RxString('');
  final RxString nameError = RxString('');
  final RxString gender = RxString('');
  final RxString genderError = RxString('');
  final RxString age = RxString('');
  final RxString ageError = RxString('');
  final Rx<UnitOfWeight> unitOfWeight = Rx<UnitOfWeight>(UnitOfWeight.kg);
  final RxString weight = RxString('');
  final RxString weightError = RxString('');
  final Rx<UnitOfTall> unitOfTall = Rx<UnitOfTall>(UnitOfTall.cm);
  final RxString tall = RxString('');
  final RxString tallError = RxString('');
  final Rx<Goal> goal = Rx<Goal>(Goal.loseWeight);
  final Rx<Activity> activity = Rx<Activity>(Activity.sedentary);
  final RxString email = RxString('');
  final RxString emailError = RxString('');
  final RxString password = RxString('');
  final RxString passwordError = RxString('');
  final RxBool isPasswordVisible = RxBool(false);
  final RxString repeatPassword = RxString('');
  final RxString repeatPasswordError = RxString('');
  final RxBool isRepeatPasswordVisible = RxBool(false);
  final Rx<dynamic> error = Rx<dynamic>(null);
  final RxString socialError = RxString('');
  final RxBool isValid = RxBool(false);

  //Name Screen
  void changeNameValue(final String value) {
    name.value = value;
  }

  bool _validName() {
    if (Validator.isEmpty(name.value)) {
      nameError.value = emptyNameError;
      return false;
    } else if (name.value.length < 2) {
      nameError.value = invalidNameError;
      return false;
    }
    return true;
  }

  // GenderScreen
  void changeGender(final String value) {
    gender.value = value;
  }

  void changeAge(final String value) {
    age.value = value;
  }

  bool _validGenderAndAge() {
    if (Validator.isEmpty(gender.value)) {
      genderError.value = emptyGenderError;
      return false;
    }
    if (Validator.isEmpty(age.value)) {
      ageError.value = emptyAgeError;
      return false;
    }
    return true;
  }

  // ParametersScreen
  void changeUnitOfWeight(final UnitOfWeight value) {
    unitOfWeight.value = value;
  }

  void changeWeight(final String value) {
    weight.value = value;
  }

  void changeUnitOfTall(final UnitOfTall value) {
    unitOfTall.value = value;
  }

  void changeTall(final String value) {
    tall.value = value;
  }

  bool _validParameters() {
    if (Validator.isEmpty(weight.value)) {
      weightError.value = emptyWeightError;
      return false;
    } else if (weight.value.length < 2) {
      weightError.value = invalidWeightError;
      return false;
    } else if (Validator.isEmpty(tall.value)) {
      tallError.value = emptyTallError;
      return false;
    } else if (unitOfTall.value.index == 0 && tall.value.length < 3) {
      tallError.value = invalidTallError;
    }
    return true;
  }

  void changeGoal(final Goal value) {
    goal.value = value;
  }

  void changeActivity(final Activity value) {
    activity.value = value;
  }

  void nextStep(final SetupStep stepValue) {
    if (stepValue.index == 0) {
      _validName();
      final isValidValue = nameError.isNotEmpty;
      isValid.value = isValidValue;
    } else if (stepValue.index == 1) {
      _validGenderAndAge();
      final isValidValue = genderError.isNotEmpty || ageError.isNotEmpty;
      isValid.value = isValidValue;
    } else if (stepValue.index == 2) {
      _validParameters();
      final isValidValue = weightError.isNotEmpty || tallError.isNotEmpty;
      isValid.value = isValidValue;
    }
    if (!isValid.value) {
      final nextIndex = (stepValue.index + 1) % SetupStep.values.length;
      step.value = SetupStep.values[nextIndex];
    }
  }

  void previusStep(final SetupStep stepValue) {
    if (stepValue.index != 0) {
      final previusIndex = (stepValue.index - 1) % SetupStep.values.length;
      step.value = SetupStep.values[previusIndex];
    }
  }

  void changeEmail(final String value) {
    emailError.value = '';
    email.value = value;
  }

  void changePassword(final String value) {
    passwordError.value = '';
    password.value = value;
  }

  void passwordVisibilityChanged() {
    isPasswordVisible.toggle();
  }

  void onRepeatPasswordChanged(final String value) {
    repeatPasswordError.value = '';
    repeatPassword.value = value;
  }

  void onRepeatPasswordVisibilityChanged() {
    isRepeatPasswordVisible.toggle();
  }

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
    if (Validator.isEmpty(repeatPassword.value)) {
      repeatPasswordError.value = emptyPasswordError;
      return false;
    }
    if (!Validator.isPasswordCorrect(repeatPassword.value)) {
      if (!Validator.hasCorrectLengthDigits(repeatPassword.value)) {
        repeatPasswordError.value = wrongLengthPasswordError;
        return false;
      } else if (!Validator.containsUpperCaseSymbol(repeatPassword.value)) {
        repeatPasswordError.value = upperCaseMissingPasswordError;
        return false;
      } else if (!Validator.containsLowerCaseSymbol(repeatPassword.value)) {
        repeatPasswordError.value = lowerCaseMissingPasswordError;
        return false;
      } else if (!Validator.containsDigits(repeatPassword.value)) {
        repeatPasswordError.value = digitsMissingPasswordError;
        return false;
      } else {
        repeatPasswordError.value = invalidPasswordError;
        return false;
      }
    }
    if (repeatPassword.value != password.value) {
      repeatPasswordError.value = passwordNotMatchError;
      return false;
    }
    return true;
  }

  Future<void> signUp() async {
    final valid = _validateFields();
    if (!valid) return;
    isLoading.value = true;

    Future<Either<BaseException, void>> callSignUp() =>
        _authRepository.signUp(SignUpModel(
          name: name.value,
          email: email.value,
          password: password.value,
          gender: gender.value,
          age: age.value,
          weightUnit: unitOfWeight.value.name,
          weight: weight.value,
          tallUnit: unitOfTall.value.name,
          tall: tall.value,
          goal: goal.value.name,
          activity: activity.value.name,
          waterGoal: 2000,
          waterCount: 0,
        ));

    final signUpResult = await callSignUp();

    signUpResult.fold(
      (final l) {
        error.value = l;
        isLoading.value = false;
      },
      (final r) {
        isLoading.value = false;
      },
    );
  }

  void clearErrors() {
    emailError.value = '';
    passwordError.value = '';
    repeatPasswordError.value = '';
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
