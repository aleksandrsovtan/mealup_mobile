import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    this.id,
    required this.name,
    required this.email,
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

  factory UserModel.fromJson(final Map<String, dynamic> json) => UserModel(
        id: json['uid'],
        name: json['name'],
        email: json['email'],
        gender: json['gender'],
        age: json['age'],
        weightUnit: json['weightUnit'],
        weight: json['weight'],
        tallUnit: json['tallUnit'],
        tall: json['tall'],
        goal: json['goal'],
        activity: json['activity'],
        waterGoal: json['waterGoal'],
        waterCount: json['waterCount'],
      );

  factory UserModel.fromSnapshot(
      final DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      name: data['name'],
      email: data['email'],
      gender: data['gender'],
      age: data['age'],
      weightUnit: data['weightUnit'],
      weight: data['weight'],
      tallUnit: data['tallUnit'],
      tall: data['tall'],
      goal: data['goal'],
      activity: data['activity'],
      waterGoal: data['waterGoal'],
      waterCount: data['waterCount'],
    );
  }

  final String? id;
  final String name;
  final String email;
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
        'uid': id,
        'name': name,
        'email': email,
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

  UserModel copyWith({
    final String? id,
    final String? name,
    final String? email,
    final String? gender,
    final String? age,
    final String? weightUnit,
    final String? weight,
    final String? tallUnit,
    final String? tall,
    final String? goal,
    final String? activity,
    final double? waterGoal,
    final double? waterCount,
  }) =>
      UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        gender: gender ?? this.gender,
        age: age ?? this.age,
        weightUnit: weightUnit ?? this.weightUnit,
        weight: weight ?? this.weight,
        tallUnit: tallUnit ?? this.tallUnit,
        tall: tall ?? this.tall,
        goal: goal ?? this.goal,
        activity: activity ?? this.activity,
        waterGoal: waterGoal ?? this.waterGoal,
        waterCount: waterCount ?? this.waterCount,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        email,
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
