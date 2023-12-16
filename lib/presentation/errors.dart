import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const emptyNameError = 'empty-name-error';
const invalidNameError = 'invalid-name-error';
const emptyGenderError = 'empty-gender-error';
const emptyAgeError = 'empty-age-error';
const emptyWeightError = 'empty-weight-error';
const invalidWeightError = 'invalid-weight-error';
const emptyTallError = 'empty-tall-error';
const invalidTallError = 'invalid-tall-error';
const emptyEmailError = 'empty-email-error';
const invalidEmailError = 'invalid-email-error';
const emptyPasswordError = 'empty-password-error';
const invalidPasswordError = 'invalid-password-error';
const passwordNotMatchError = 'password-not-match-error';
const upperCaseMissingPasswordError = 'uppercase-missing-password-error';
const lowerCaseMissingPasswordError = 'lowercase-missing-password-error';
const digitsMissingPasswordError = 'digits-missing-password-error';
const wrongLengthPasswordError = 'wrong-length-password-error';
const facebookError = 'facebook-error';
const googleError = 'google-error';
const appleError = 'apple-error';

String? parseValidationError(
    final BuildContext context, final String? errorCode) {
  if (errorCode == null || errorCode.isEmpty) return null;
  switch (errorCode) {
    case emptyNameError:
      return AppLocalizations.of(context)!.empty_name_error;
    case invalidNameError:
      return AppLocalizations.of(context)!.invalid_name_error;
    case emptyGenderError:
      return AppLocalizations.of(context)!.empty_gender_error;
    case emptyAgeError:
      return AppLocalizations.of(context)!.empty_age_error;
    case emptyWeightError:
      return AppLocalizations.of(context)!.empty_weight_error;
    case invalidWeightError:
      return AppLocalizations.of(context)!.invalid_weight_error;
    case emptyTallError:
      return AppLocalizations.of(context)!.empty_tall_error;
    case invalidTallError:
      return AppLocalizations.of(context)!.invalid_tall_error;
    case emptyEmailError:
      return AppLocalizations.of(context)!.empty_email_address_error;
    case invalidEmailError:
      return AppLocalizations.of(context)!.invalid_email_address_error;
    case emptyPasswordError:
      return AppLocalizations.of(context)!.empty_password_error;
    case invalidPasswordError:
      return AppLocalizations.of(context)!.invalid_password_error;
    case passwordNotMatchError:
      return AppLocalizations.of(context)!.password_not_match_error;
    case upperCaseMissingPasswordError:
      return AppLocalizations.of(context)!.uppercase_missing_password_error;
    case lowerCaseMissingPasswordError:
      return AppLocalizations.of(context)!.lowercase_missing_password_error;
    case digitsMissingPasswordError:
      return AppLocalizations.of(context)!.digits_missing_password_error;
    case wrongLengthPasswordError:
      return AppLocalizations.of(context)!.wrong_length_password_error;
    default:
      throw Exception('Undefined errorCode: $errorCode');
  }
}

String? parseSocialError(final BuildContext context, final String? errorCode) {
  if (errorCode == null || errorCode.isEmpty) return null;
  switch (errorCode) {
    case facebookError:
      return AppLocalizations.of(context)!.facebook_error;
    case googleError:
      return AppLocalizations.of(context)!.google_error;
    case appleError:
      return AppLocalizations.of(context)!.apple_error;
    default:
      throw Exception('Undefined errorCode: $errorCode');
  }
}
