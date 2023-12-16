import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mealsup_mobile/presentation/resources/emoji.dart';

enum Goal { loseWeight, maintainWeight, gainWeight }

extension GoalsExtension on Goal {
  String getStringValue(final BuildContext context) {
    switch (this) {
      case Goal.loseWeight:
        return AppLocalizations.of(context)!.lose_weight;
      case Goal.maintainWeight:
        return AppLocalizations.of(context)!.maintain_weight;
      case Goal.gainWeight:
        return AppLocalizations.of(context)!.gain_weight;
    }
  }

  String getIconValue(final BuildContext context) {
    switch (this) {
      case Goal.loseWeight:
        return AppEmoji.manRunning;
      case Goal.maintainWeight:
        return AppEmoji.personInLotusPosition;
      case Goal.gainWeight:
        return AppEmoji.personLiftingWeights;
    }
  }
}
