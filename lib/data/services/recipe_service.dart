import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mealsup_mobile/core/error/exceptions.dart';
import 'package:mealsup_mobile/data/model/response/recipe_model.dart';
import 'package:mealsup_mobile/main.dart';

class RecipeService extends GetxService {
  RecipeService();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createRecipe(final RecipeModel recipeModel) async {
    try {
      final result = await _db.collection('recipes').add(recipeModel.toJson());
      logger.i('Success $result');
    } on FirebaseException catch (e, stack) {
      throw parseException(e, stack, 'Create recipes failed');
    }
  }

  Future<void> getRecipes() async {
    try {
      final snapshot = await _db.collection('recipes').get();
      final recipes = snapshot.docs.map((e) => RecipeModel.fromSnapshot(e));
      print('aloalo $recipes');
      logger.i('Success $recipes');
    } on FirebaseException catch (e, stack) {
      throw parseException(e, stack, 'Create recipes failed');
    }
  }

  Stream<List<RecipeModel>> getRecipesStream() {
    try {
      return _db.collection('recipes').snapshots().map((final querySnapshot) =>
          querySnapshot.docs
              .map((doc) => RecipeModel.fromSnapshot(doc))
              .toList());
    } on FirebaseException catch (e, stack) {
      throw parseException(e, stack, 'Get recipes failed');
    }
  }
}
