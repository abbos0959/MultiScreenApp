import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screen_app/data/dummy_data.dart';

final provider = Provider((ref) {
  return dummyMeals;
});
