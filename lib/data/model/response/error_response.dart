import 'package:equatable/equatable.dart';

class ErrorResponse extends Equatable {
  const ErrorResponse(this.message);

  factory ErrorResponse.fromJson(final Map<String, dynamic> json) {
    if (json.containsKey('message')) {
      return ErrorResponse(json['message']);
    }
    if (json.containsKey('error')) {
      return ErrorResponse(json['error']);
    }
    return const ErrorResponse('Error cloud not be parsed');
  }

  final String message;

  @override
  List<Object?> get props => [message];
}
