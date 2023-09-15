import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screen_app/providers/meals_provider.dart';

enum Filter { glutenfree, lactosefree, vegetarian, vegan }

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.glutenfree: false,
          Filter.lactosefree: false,
          Filter.vegan: false,
          Filter.vegetarian: false
        });
  void setFilters(Map<Filter, bool> chooseFilter) {
    state = chooseFilter;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
    (ref) => FilterNotifier());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(provider);
  final activeFilter = ref.watch(filterProvider);
  return meals.where((element) {
    if (activeFilter[Filter.glutenfree]! && !element.isGlutenFree) {
      return false;
    }
    if (activeFilter[Filter.lactosefree]! && !element.isLactoseFree) {
      return false;
    }
    if (activeFilter[Filter.vegan]! && !element.isVegan) {
      return false;
    }
    if (activeFilter[Filter.vegetarian]! && !element.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
