import 'package:equatable/equatable.dart';

class RecipeModel extends Equatable {
  const RecipeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.calories,
    required this.preparationTime,
    required this.favorite,
  });

  factory RecipeModel.fromJson(final Map<String, dynamic> json) => RecipeModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        calories: json['calories'],
        preparationTime: json['preparationTime'],
        favorite: json['favorite'],
      );

  final String id;
  final String name;
  final String description;
  final int calories;
  final int preparationTime;
  final bool favorite;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'calories': calories,
        'preparationTime': preparationTime,
        'favorite': favorite,
      };

  RecipeModel copyWith({
    final String? id,
    final String? name,
    final String? description,
    final int? calories,
    final int? preparationTime,
    final bool? favorite,
  }) =>
      RecipeModel(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        calories: calories ?? this.calories,
        preparationTime: preparationTime ?? this.preparationTime,
        favorite: favorite ?? this.favorite,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        calories,
        preparationTime,
        favorite,
      ];
}
