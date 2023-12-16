import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    this.id,
    required this.email,
    required this.name,
  });

  final String? id;
  final String email;
  final String name;

  @override
  List<Object?> get props => [
        id,
        email,
        name,
      ];
}
