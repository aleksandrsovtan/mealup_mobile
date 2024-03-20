import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mealsup_mobile/main.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/icons.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_button.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_search_field.dart';

class RecipesSearch extends StatelessWidget {
  const RecipesSearch({super.key});

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          top: 24,
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomSearchField(
                hintText: AppLocalizations.of(context)!.search_for_recipes,
                readOnly: true,
              ),
            ),
            const SizedBox(width: 15),
            CustomButton(
              width: 44,
              height: 44,
              borderRadius: 22,
              backgroundColor: AppColors.white,
              onTap: () {
                logger.d(' () => filter tapped');
              },
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  AppIcons.filterList,
                  height: 24,
                  width: 24,
                  colorFilter: const ColorFilter.mode(
                    AppColors.primaryColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
