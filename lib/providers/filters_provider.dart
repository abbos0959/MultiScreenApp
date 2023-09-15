import 'package:flutter_riverpod/flutter_riverpod.dart';

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
