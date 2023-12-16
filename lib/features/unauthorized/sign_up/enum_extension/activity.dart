import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mealsup_mobile/presentation/resources/emoji.dart';

enum Activity { sedentary, lightlyActive, veryActive }

extension ActivitiesExtension on Activity {
  String getStringValue(final BuildContext context) {
    switch (this) {
      case Activity.sedentary:
        return AppLocalizations.of(context)!.sedentary;
      case Activity.lightlyActive:
        return AppLocalizations.of(context)!.lightly_active;
      case Activity.veryActive:
        return AppLocalizations.of(context)!.very_active;
    }
  }

  String getDiscriptionValue(final BuildContext context) {
    switch (this) {
      case Activity.sedentary:
        return AppLocalizations.of(context)!.exercise_first;
      case Activity.lightlyActive:
        return AppLocalizations.of(context)!.exercise_midl;
      case Activity.veryActive:
        return AppLocalizations.of(context)!.exercise_last;
    }
  }

  String getIconValue(final BuildContext context) {
    switch (this) {
      case Activity.sedentary:
        return AppEmoji.manTechnologist;
      case Activity.lightlyActive:
        return AppEmoji.manDancing;
      case Activity.veryActive:
        return AppEmoji.personSurfing;
    }
  }
}
