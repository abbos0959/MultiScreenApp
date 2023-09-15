import 'package:flutter/material.dart';
import 'package:screen_app/models/meals.dart';
import 'package:screen_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    this.title,
    // required this.ontoglefavourite,
  });
  // final void Function(Meal meal) ontoglefavourite;

  final String? title;
  final List<Meal> meals;
  // final Function()? savedFunctionFavourite;

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
          itemBuilder: (ctx, index) => MealItem(
                // ontoglefavourite: ontoglefavourite,
                meal: meals[index],
              ));
    }

    if (title == null) {
      return content;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: content);
  }
}
