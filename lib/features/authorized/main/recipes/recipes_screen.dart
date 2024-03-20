import 'package:flutter/material.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/widgets/recipes_header.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/widgets/recipes_large_card.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/widgets/recipes_search.dart';
import 'package:mealsup_mobile/features/authorized/main/recipes/widgets/recipes_tabs.dart';
import 'package:mealsup_mobile/presentation/resources/colors.dart';

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(final BuildContext context) => const Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Column(
          children: [
            RecipesHeader(),
            RecipesSearch(),
            RecipesTabs(),
            SizedBox(height: 24),
            RecipesLargeCard(
              recipeImage:
                  'https://www.washingtonpost.com/wp-apps/imrs.php?src=https://arc-anglerfish-washpost-prod-washpost.s3.amazonaws.com/public/63O2DBTTTEI6VKN5T6FVSMYA2A.jpg&w=860',
              recipeName: 'Vegetable salat with chicken and cheese (test)',
              caloriesCount: 150,
              preparationTime: 20,
            ),
          ],
        ),
      );
}
