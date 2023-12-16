import 'package:equatable/equatable.dart';

class WaterGlassModel extends Equatable {
  const WaterGlassModel({
    required this.id,
    required this.isFull,
  });

  factory WaterGlassModel.fromJson(final Map<String, dynamic> json) =>
      WaterGlassModel(
        id: json['id'],
        isFull: json['isFull'],
      );

  factory WaterGlassModel.fromMap(final Map<String, dynamic> map) =>
      WaterGlassModel(
        id: map['id'],
        isFull: map['isFull'],
      );

  final String id;
  final bool isFull;

  Map<String, dynamic> toJson() => {
        'id': id,
        'isFull': isFull,
      };

  WaterGlassModel copyWith({
    final String? id,
    final bool? isFull,
  }) =>
      WaterGlassModel(
        id: id ?? this.id,
        isFull: isFull ?? this.isFull,
      );

  @override
  List<Object?> get props => [
        id,
        isFull,
      ];
}
