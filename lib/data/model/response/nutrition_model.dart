import 'package:equatable/equatable.dart';

class NutritionModel extends Equatable {
  const NutritionModel({
    required this.calories,
    required this.fat,
    required this.protein,
    required this.garbs,
  });

  factory NutritionModel.fromJson(final Map<String, dynamic> json) =>
      NutritionModel(
        calories: json['calories'],
        fat: json['fat'],
        protein: json['protein'],
        garbs: json['garbs'],
      );

  final int calories;
  final double fat;
  final double protein;
  final double garbs;

  Map<String, dynamic> toJson() => {
        'calories': calories,
        'fat': fat,
        'protein': protein,
        'garbs': garbs,
      };

  NutritionModel copyWith({
    final int? calories,
    final double? fat,
    final double? protein,
    final double? garbs,
  }) =>
      NutritionModel(
        calories: calories ?? this.calories,
        fat: fat ?? this.fat,
        protein: protein ?? this.protein,
        garbs: garbs ?? this.garbs,
      );

  @override
  List<Object?> get props => [
        calories,
        fat,
        protein,
        garbs,
      ];
}
