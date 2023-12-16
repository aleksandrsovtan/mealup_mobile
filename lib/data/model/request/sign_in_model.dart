import 'package:equatable/equatable.dart';

class SignInModel extends Equatable {
  const SignInModel(
    this.email,
    this.password,
  );

  final String email;
  final String password;

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
