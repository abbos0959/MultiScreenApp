import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screen_app/screens/meals.dart';
import 'package:screen_app/screens/tabs.dart';
import 'package:screen_app/widgets/main_drawer.dart';

import 'package:screen_app/providers/filters_provider.dart';

class Filters extends ConsumerWidget {
  const Filters({
    super.key,
  });

  // void _selectdraw2(String value) {
  //   Navigator.of(context).pop();
  //   if (value == "ovqatlar") {
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (ctx) => const TabScreen(),
  //       ),
  //     );
  //   }
  // }

  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sizning filteringiz"),
      ),
      // drawer: MainDrawer(onselectdraw: _selectdraw2),
      body: Column(children: [
        SwitchListTile(
            value: activeFilter[Filter.lactosefree]!,
            title: Text(
              "Lactose bepul",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "faqat bepul lactose chiqarish  ",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 20),
            onChanged: (val) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactosefree, val);
            }),
        SwitchListTile(
            value: activeFilter[Filter.glutenfree]!,
            title: Text(
              "gluten bepul",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "faqat bepul glutenlarni chiqarish ",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 20),
            onChanged: (val) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.glutenfree, val);
            }),
        SwitchListTile(
            value: activeFilter[Filter.vegetarian]!,
            title: Text(
              "Vegetarian bepul",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "faqat bepul Vegetarian chiqarish  ",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 20),
            onChanged: (val) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, val);
            }),
        SwitchListTile(
            value: activeFilter[Filter.vegan]!,
            title: Text(
              "Vegan bepul",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              "faqat bepul Vegan chiqarish  ",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 20),
            onChanged: (val) {
              ref.read(filterProvider.notifier).setFilter(Filter.vegan, val);
            }),
      ]),
    );
  }
}
