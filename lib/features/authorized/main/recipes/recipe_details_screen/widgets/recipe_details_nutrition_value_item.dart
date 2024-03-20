import 'package:flutter/material.dart';
import 'package:mealsup_mobile/presentation/resources/fonts.dart';

class RecipeDetailsNutritionValueItem extends StatelessWidget {
  const RecipeDetailsNutritionValueItem({
    super.key,
    required this.color,
    required this.name,
    required this.value,
  });
  final Color color;
  final String name;
  final String value;

  @override
  Widget build(final BuildContext context) => Row(
        children: [
          Container(
            height: 40,
            width: 8,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: AppTextStyles.dmSans16
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(name, style: AppTextStyles.dmSans14),
            ],
          ),
        ],
      );
}
