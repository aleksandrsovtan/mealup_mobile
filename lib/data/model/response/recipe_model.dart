import 'package:equatable/equatable.dart';
import 'package:mealsup_mobile/data/model/response/ingredient_model.dart';
import 'package:mealsup_mobile/data/model/response/nutrition_model.dart';
import 'package:mealsup_mobile/data/model/response/step_model.dart';

class RecipeModel extends Equatable {
  const RecipeModel({
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.nutritions,
    required this.preparationTime,
    required this.preparationSteps,
    required this.ingredients,
  });

  factory RecipeModel.fromJson(final Map<String, dynamic> json) => RecipeModel(
        id: json['id'],
        image: json['image'],
        name: json['name'],
        description: json['description'],
        nutritions: json['nutritions'],
        preparationTime: json['preparationTime'],
        preparationSteps: json['preparationSteps'],
        ingredients: json['ingredients'],
      );

  final String id;
  final String image;
  final String name;
  final String description;
  final NutritionModel nutritions;
  final int preparationTime;
  final List<StepModel> preparationSteps;
  final List<IngredientModel> ingredients;

  Map<String, dynamic> toJson() => {
        'id': id,
        'image': image,
        'name': name,
        'description': description,
        'nutritions': nutritions.toJson(),
        'preparationTime': preparationTime,
        'preparationSteps': preparationSteps,
        'ingredients': ingredients,
      };

  RecipeModel copyWith({
    final String? id,
    final String? image,
    final String? name,
    final String? description,
    final NutritionModel? nutritions,
    final int? preparationTime,
    final List<StepModel>? preparationSteps,
    final List<IngredientModel>? ingredients,
  }) =>
      RecipeModel(
        id: id ?? this.id,
        image: image ?? this.image,
        name: name ?? this.name,
        description: description ?? this.description,
        nutritions: nutritions ?? this.nutritions,
        preparationTime: preparationTime ?? this.preparationTime,
        preparationSteps: preparationSteps ?? this.preparationSteps,
        ingredients: ingredients ?? this.ingredients,
      );

  @override
  List<Object?> get props => [
        id,
        image,
        name,
        description,
        nutritions,
        preparationTime,
        preparationSteps,
        ingredients,
      ];
}
