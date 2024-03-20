import 'package:equatable/equatable.dart';

class StepModel extends Equatable {
  const StepModel({
    required this.title,
    required this.description,
    this.imageUrl,
  });

  factory StepModel.fromJson(final Map<String, dynamic> json) => StepModel(
        title: json['title'],
        description: json['description'],
        imageUrl: json['imageUrl'],
      );

  final String title;
  final String description;
  final String? imageUrl;

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
      };

  StepModel copyWith({
    final String? title,
    final String? description,
    final String? imageUrl,
  }) =>
      StepModel(
        title: title ?? this.title,
        description: description ?? this.description,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  @override
  List<Object?> get props => [
        title,
        description,
        imageUrl,
      ];
}
