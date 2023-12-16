import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';

class AcceptTerms extends StatelessWidget {
  const AcceptTerms({
    final Key? key,
    required this.onTapTerms,
    required this.onTapPrivacyPolicy,
  }) : super(key: key);

  final VoidCallback onTapTerms;
  final VoidCallback onTapPrivacyPolicy;

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.agree_to_submit_to,
                style: AppTextStyles.dmSans14w500,
              ),
              const SizedBox(width: 4),
              InkWell(
                onTap: onTapTerms,
                child: Text(
                  AppLocalizations.of(context)!.app_terms_and_conditions,
                  style: AppTextStyles.dmSans14w500.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                AppLocalizations.of(context)!.and,
                style: AppTextStyles.dmSans14w500,
              ),
              const SizedBox(width: 4),
              InkWell(
                onTap: onTapPrivacyPolicy,
                child: Text(
                  AppLocalizations.of(context)!.privacy_policy,
                  style: AppTextStyles.dmSans14w500.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}
