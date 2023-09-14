import 'package:flutter/material.dart';
import 'package:screen_app/models/meals.dart';
import 'package:screen_app/screens/meals_details.dart';
import 'package:screen_app/widgets/meal_item_trat.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key, required this.meal, required this.ontoglefavourite});
  final Meal meal;
  final void Function(Meal meal) ontoglefavourite;

  String get complexitytext {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordability {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  void _fun(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealsDetails(
              ontoglefavourite: ontoglefavourite,
              meal: meal,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      clipBehavior: Clip.hardEdge,
      // elevation: 120,
      child: InkWell(
        onTap: () {
          _fun(context, meal);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.black54),
                  // color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrat(
                              icon: Icons.schedule,
                              label: "${meal.duration} min"),
                          const SizedBox(
                            width: 10,
                          ),
                          MealItemTrat(icon: Icons.work, label: complexitytext),
                          const SizedBox(
                            width: 10,
                          ),
                          MealItemTrat(
                              icon: Icons.attach_money, label: affordability),
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
