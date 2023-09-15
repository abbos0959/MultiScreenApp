import 'package:cuberto_bottom_bar/internal/internal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screen_app/data/dummy_data.dart';
import 'package:screen_app/models/meals.dart';
import 'package:screen_app/providers/favourites_provider.dart';
import 'package:screen_app/providers/meals_provider.dart';
import 'package:screen_app/screens/categories.dart';
import 'package:screen_app/screens/filters.dart';
import 'package:screen_app/screens/meals.dart';
import 'package:screen_app/widgets/main_drawer.dart';
import 'package:screen_app/providers/filters_provider.dart';

const initialfilters = {
  Filter.glutenfree: false,
  Filter.lactosefree: false,
  Filter.vegan: false,
  Filter.vegetarian: false
};

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState<TabScreen> {
  bool ischek = false;

  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _selectdraw(String value) async {
    Navigator.of(context).pop();

    if (value == "filter") {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => const Filters(
              // currenFilter: _selectedfilters,
              ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(provider);
    final activeFilter = ref.watch(filterProvider);
    final availableMeals = meals.where((element) {
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

    Widget activePage = CategoriesScreen(availableMeals: availableMeals);
    String activePageTitle = "Categories";

    if (_selectedIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);

      activePage = MealsScreen(
        meals: favouriteMeals,
      );
      activePageTitle = "Sevimlilaringiz";
    }

    return Scaffold(
      appBar: AppBar(title: Text(activePageTitle)),
      drawer: MainDrawer(onselectdraw: _selectdraw),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.set_meal,
              ),
              label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              label: "Sevimlilar")
        ],
      ),
    );
  }
}
