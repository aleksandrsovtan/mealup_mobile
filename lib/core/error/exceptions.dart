import 'package:firebase_auth/firebase_auth.dart';

class BaseException implements Exception {
  BaseException({
    required this.cause,
    required this.message,
    this.stack,
  });

  final Object cause;
  final String message;
  final StackTrace? stack;

  @override
  String toString() => message;
}

BaseException parseException(
  final Object exception,
  final StackTrace stackTrace,
  final String defaultMessage,
) {
  if (exception is FirebaseException) {
    final String errorMessage;
    if (exception.message != null) {
      errorMessage = exception.message!;
    } else {
      errorMessage = exception.message ?? 'Unknown error';
    }
    return BaseException(
        cause: exception, message: errorMessage, stack: stackTrace);
  } else {
    return BaseException(
      cause: exception,
      message: defaultMessage,
      stack: stackTrace,
    );
  }
}
