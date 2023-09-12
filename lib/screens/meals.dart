import 'package:flutter/material.dart';
import 'package:screen_app/models/meals.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.meals, required this.title});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: const EdgeInsets.all(28.0),
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            " O yo'q noma'lum xatolikka yo'l qo'yildi endi nima qilamiz ey voh",
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Qovoqbosh  boshqa categoriya bo'yicha tanlachi zora omading kelib qolsa",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          )
        ]),
      ),
    ); 
    if (meals.isNotEmpty) {
      content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => Text(meals[index].title));
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: content);
  }
}
