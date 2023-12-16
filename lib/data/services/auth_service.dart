import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/core/error/exceptions.dart';
import 'package:mealsup_mobile/data/model/request/sign_in_model.dart';
import 'package:mealsup_mobile/data/model/request/sign_up_model.dart';
import 'package:mealsup_mobile/data/model/response/user_model.dart';
import 'package:mealsup_mobile/main.dart';

class AuthService extends GetxService {
  AuthService();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> signIn(final SignInModel signInModel) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: signInModel.email, password: signInModel.password);
    } on FirebaseException catch (e, stack) {
      throw parseException(e, stack, 'SignIn failed');
    }
  }

  Future<UserModel> signUp(final SignUpModel signUpModel) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: signUpModel.email, password: signUpModel.password);
      final UserModel userModel = UserModel(
        name: signUpModel.name,
        email: signUpModel.email,
        gender: signUpModel.gender,
        age: signUpModel.age,
        weightUnit: signUpModel.weightUnit,
        weight: signUpModel.weight,
        tallUnit: signUpModel.tallUnit,
        tall: signUpModel.tall,
        goal: signUpModel.goal,
        activity: signUpModel.activity,
        waterGoal: signUpModel.waterGoal,
        waterCount: signUpModel.waterCount,
      );
      return userModel;
    } on FirebaseException catch (e, stack) {
      throw parseException(e, stack, 'SignUp failed');
    }
  }

  Future<void> createUser(final UserModel userModel) async {
    try {
      final result = await _db.collection('users').add(userModel.toJson());
      logger.i('Success $result');
    } on FirebaseException catch (e, stack) {
      throw parseException(e, stack, 'Create user failed');
    }
  }

  Future<UserModel> getUserData(final String email) async {
    try {
      final snapshot =
          await _db.collection('users').where('email', isEqualTo: email).get();
      final UserModel userModel =
          snapshot.docs.map((final e) => UserModel.fromSnapshot(e)).single;
      logger.i('Success $userModel');
      return userModel;
    } on FirebaseException catch (e, stack) {
      throw parseException(e, stack, 'Create user failed');
    }
  }

  Future<void> logOut() async {
    await _auth.signOut();
  }
}
