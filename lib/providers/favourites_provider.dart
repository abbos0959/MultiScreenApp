import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screen_app/models/meals.dart';

class FavouriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavouriteMealsNotifier() : super([]);

  bool toogleMealFavouritetatus(Meal meals) {
    final mealsIsFavourite = state.contains(meals);
    if (mealsIsFavourite) {
      state = state.where((element) => element.id != meals.id).toList();
      return false;
    } else {
      state = [...state, meals];
      return true;
    }
  }
}

final favouriteMealsProvider =
    StateNotifierProvider<FavouriteMealsNotifier, List<Meal>>((ref) {
  return FavouriteMealsNotifier();
});
