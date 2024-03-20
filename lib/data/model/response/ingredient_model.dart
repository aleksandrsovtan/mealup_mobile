import 'package:equatable/equatable.dart';

class IngredientModel extends Equatable {
  const IngredientModel({
    required this.name,
    required this.value,
  });

  factory IngredientModel.fromJson(final Map<String, dynamic> json) =>
      IngredientModel(
        name: json['name'],
        value: json['value'],
      );

  final String name;
  final String value;

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value,
      };

  IngredientModel copyWith({
    final String? name,
    final String? value,
  }) =>
      IngredientModel(
        name: name ?? this.name,
        value: value ?? this.value,
      );

  @override
  List<Object?> get props => [
        name,
        value,
      ];
}
