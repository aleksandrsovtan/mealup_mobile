import 'package:equatable/equatable.dart';

class SignUpModel extends Equatable {
  const SignUpModel({
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.age,
    required this.weightUnit,
    required this.weight,
    required this.tallUnit,
    required this.tall,
    required this.goal,
    required this.activity,
    required this.waterGoal,
    required this.waterCount,
  });

  final String name;
  final String email;
  final String password;
  final String gender;
  final String age;
  final String weightUnit;
  final String weight;
  final String tallUnit;
  final String tall;
  final String goal;
  final String activity;
  final double waterGoal;
  final double waterCount;

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'gender': gender,
        'age': age,
        'weightUnit': weightUnit,
        'weight': weight,
        'tallUnit': tallUnit,
        'tall': tall,
        'goal': goal,
        'activity': activity,
        'waterGoal': waterGoal,
        'waterCount': waterCount,
      };

  @override
  List<Object?> get props => [
        name,
        email,
        password,
        gender,
        age,
        weightUnit,
        weight,
        tallUnit,
        tall,
        goal,
        activity,
        waterGoal,
        waterCount,
      ];
}
