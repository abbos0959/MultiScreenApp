import 'package:flutter/material.dart';
import 'package:screen_app/screens/meals.dart';
import 'package:screen_app/screens/tabs.dart';
import 'package:screen_app/widgets/main_drawer.dart';

enum Filter { glutenfree, lactosefree, vegetarian, vegan }

class Filters extends StatefulWidget {
  const Filters({super.key, required this.currenFilter});
  final Map<Filter, bool> currenFilter;
  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var _glutenFilters = false;
  var _lactoseilters = false;
  var _veganFilters = false;
  var _vegetarianFilters = false;
  void _selectdraw2(String value) {
    Navigator.of(context).pop();
    if (value == "ovqatlar") {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => const TabScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _glutenFilters = widget.currenFilter[Filter.glutenfree]!;
    _lactoseilters = widget.currenFilter[Filter.lactosefree]!;
    _veganFilters = widget.currenFilter[Filter.vegan]!;
    _vegetarianFilters = widget.currenFilter[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sizning filteringiz"),
      ),
      // drawer: MainDrawer(onselectdraw: _selectdraw2),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenfree: _glutenFilters,
            Filter.lactosefree: _lactoseilters,
            Filter.vegan: _veganFilters,
            Filter.vegetarian: _veganFilters
          });
          return false;
        },
        child: Column(children: [
          SwitchListTile(
              value: _lactoseilters,
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
                setState(() {
                  _lactoseilters = val;
                });
              }),
          SwitchListTile(
              value: _glutenFilters,
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
                setState(() {
                  _glutenFilters = val;
                });
              }),
          SwitchListTile(
              value: _vegetarianFilters,
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
                setState(() {
                  _vegetarianFilters = val;
                });
              }),
          SwitchListTile(
              value: _veganFilters,
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
                setState(() {
                  _veganFilters = val;
                });
              }),
        ]),
      ),
    );
  }
}
