import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mealsup_mobile/main.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';
import 'package:mealsup_mobile/presentation/resources/icons.dart';
import 'package:mealsup_mobile/presentation/widgets/custom_button.dart';

class RecipesHeader extends StatelessWidget {
  const RecipesHeader({super.key});

  @override
  Widget build(final BuildContext context) => Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: MediaQuery.of(context).padding.top + 24,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              AppLocalizations.of(context)!.recipes,
              style: AppTextStyles.h1.copyWith(
                fontSize: 30,
                color: AppColors.titleColor,
              ),
            ),
            const Spacer(),
            CustomButton(
              width: 52,
              borderRadius: 20,
              backgroundColor: AppColors.primaryColor,
              onTap: () {
                logger.d(' () => shoppingBasket tapped');
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: SvgPicture.asset(
                  AppIcons.shoppingBasket,
                  height: 20,
                  width: 20,
                  colorFilter: const ColorFilter.mode(
                    AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
