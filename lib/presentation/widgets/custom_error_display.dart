import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';

class CustomErrorDisplay extends StatelessWidget {
  const CustomErrorDisplay({
    final Key? key,
    required this.errorMessage,
  }) : super(key: key);

  final String errorMessage;

  @override
  Widget build(final BuildContext context) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.redError.withOpacity(0.15),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.oops,
              style: AppTextStyles.button.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
            Text(
              errorMessage,
              style: AppTextStyles.dmSans12,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ],
        ),
      );
}
