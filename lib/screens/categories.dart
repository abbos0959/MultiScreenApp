import 'package:flutter/material.dart';
import 'package:screen_app/data/dummy_data.dart';
import 'package:screen_app/screens/meals.dart';
import 'package:screen_app/widgets/category_grid_item.dart';
import 'package:screen_app/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category categorycha) {
    final data = dummyMeals
        .where((element) => element.categories.contains(categorycha.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsScreen(meals: data, title: categorycha.title)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bu Screen app"),
        ),
        body: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          children: [
            for (final ca in availableCategories)
              CategorGridItems(
                  category: ca,
                  select: () {
                    _selectCategory(context, ca);
                  })
          ],
        ),
      ),
    );
  }
}
