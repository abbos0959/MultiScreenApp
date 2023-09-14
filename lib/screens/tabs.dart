import 'package:cuberto_bottom_bar/internal/internal.dart';
import 'package:flutter/material.dart';
import 'package:screen_app/data/dummy_data.dart';
import 'package:screen_app/models/meals.dart';
import 'package:screen_app/screens/categories.dart';
import 'package:screen_app/screens/filters.dart';
import 'package:screen_app/screens/meals.dart';
import 'package:screen_app/widgets/main_drawer.dart';

const initialfilters = {
  Filter.glutenfree: false,
  Filter.lactosefree: false,
  Filter.vegan: false,
  Filter.vegetarian: false
};

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Meal> products = [];
  bool ischek = false;

  void _showmessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  Map<Filter, bool> _selectedfilters = initialfilters;

  void _savedFunctionFavourite(Meal value) {
    final ischeckingFavourite = products.contains(value);

    setState(() {
      if (ischeckingFavourite) {
        products.remove(value);
        _showmessage(' Sevimlilardan olib tashlandi');
        ischek = false;
      } else {
        products.add(value);
        _showmessage('sevimlilarga  qo\'shildi');
        ischek = true;
      }
    });
  }

  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _selectdraw(String value) async {
    Navigator.of(context).pop();

    if (value == "filter") {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) => Filters(
            currenFilter: _selectedfilters,
          ),
        ),
      );
      setState(() {
        _selectedfilters = result ?? initialfilters;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = dummyMeals.where((element) {
      if (_selectedfilters[Filter.glutenfree]! && !element.isGlutenFree) {
        return false;
      }
      if (_selectedfilters[Filter.lactosefree]! && !element.isLactoseFree) {
        return false;
      }
      if (_selectedfilters[Filter.vegan]! && !element.isVegan) {
        return false;
      }
      if (_selectedfilters[Filter.vegetarian]! && !element.isVegetarian) {
        return false;
      }
      return true;
    }).toList();

    Widget activePage = CategoriesScreen(
        ontoglefavourite: _savedFunctionFavourite,
        availableMeals: availableMeals);
    String activePageTitle = "Categories";

    if (_selectedIndex == 1) {
      activePage = MealsScreen(
        meals: products,
        ontoglefavourite: _savedFunctionFavourite,
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
