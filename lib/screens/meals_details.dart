import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screen_app/models/meals.dart';
import 'package:screen_app/providers/favourites_provider.dart';

class MealsDetails extends ConsumerWidget {
  const MealsDetails({
    super.key,
    required this.meal,
    // required this.ontoglefavourite,
  });
  final Meal meal;
  // final void Function(Meal meal) ontoglefavourite;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
              onPressed: () {
                final ischecked = ref
                    .read(favouriteMealsProvider.notifier)
                    .toogleMealFavouritetatus(meal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(ischecked
                        ? " sevimlilarga qo'shildi"
                        : " sevimlilardan olib tashlandi"),
                  ),
                );
              },
              icon: Icon(Icons.stars))
        ],
      ),
      body: ListView(
        children: [
          Image.network(
            meal.imageUrl,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 22,
          ),
          Text(
            "Masalliqlar",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 12,
          ),
          for (final sal in meal.ingredients)
            Text(
              sal,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
              textAlign: TextAlign.center,
            ),
          const SizedBox(
            height: 24,
          ),
          Text(
            "Qadamlar",
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onBackground,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 24,
          ),
          for (final sal in meal.steps)
            Text(
              sal,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onBackground),
              textAlign: TextAlign.center,
            ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
