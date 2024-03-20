import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Helper {
  static String formatPreparationTime(
      final BuildContext context, final int minutes) {
    if (minutes < 60) {
      // If less than 60 minutes, display only minutes
      return AppLocalizations.of(context)!.minutes_count(minutes);
    } else {
      // If 60 minutes or more, format as hours and minutes
      final int hours = minutes ~/ 60;
      final int remainingMinutes = minutes % 60;
      if (remainingMinutes == 0) {
        // If no remaining minutes, display only hours
        return AppLocalizations.of(context)!.hours_count(hours);
      } else {
        // If there are remaining minutes, display both hours and minutes
        return AppLocalizations.of(context)!
            .hours_and_minutes_count(hours, remainingMinutes);
      }
    }
  }
}
