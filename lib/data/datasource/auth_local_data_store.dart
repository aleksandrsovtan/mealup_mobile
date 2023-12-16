import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mealsup_mobile/data/model/response/user_model.dart';

const kUserModelKey = 'user_model';
const kAccessToken = 'access_token';
const kRefreshToken = 'refresh_token';
const kAuthProvider = 'auth_provider';
const kUserEmailKey = 'user_email';

class AuthLocalDataStore {
  const AuthLocalDataStore();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> storeUserEmail(final String userEmail) =>
      _secureStorage.write(key: kUserEmailKey, value: userEmail);

  Future<void> storeUserModel(final UserModel userModel) =>
      _secureStorage.write(key: kUserModelKey, value: jsonEncode(userModel));

  Future<String?> getUserEmail() => _secureStorage.read(key: kUserEmailKey);

  Future<UserModel?> getUserModel() async {
    final userModelString = await _secureStorage.read(key: kUserModelKey);
    if (userModelString == null) return null;
    return UserModel.fromJson(jsonDecode(userModelString));
  }

  Future<String?> getAccessToken() => _secureStorage.read(key: kAccessToken);

  Future<void> storeAccessToken(final String accessToken) =>
      _secureStorage.write(key: kAccessToken, value: accessToken);

  Future<String?> getAuthProvider() => _secureStorage.read(key: kAuthProvider);

  Future<void> storeAuthProvider(final String authProvider) =>
      _secureStorage.write(
        key: kAuthProvider,
        value: authProvider,
      );

  Future<String?> getRefreshToken() => _secureStorage.read(key: kRefreshToken);

  Future<void> storeRefreshToken(final String refreshToken) =>
      _secureStorage.write(key: kRefreshToken, value: refreshToken);

  Future<void> clearCache() async {
    await _secureStorage.delete(key: kUserModelKey);
    await _secureStorage.delete(key: kAccessToken);
    await _secureStorage.delete(key: kRefreshToken);
    await _secureStorage.delete(key: kAuthProvider);
  }

  Future<void> clearUserEmail() async {
    await _secureStorage.delete(key: kUserEmailKey);
  }
}
