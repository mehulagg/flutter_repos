import 'package:flutter/material.dart';
import 'package:meals/dummy_data.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/category_meals_screen.dart';
import 'package:meals/screens/filters_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    _filters = filterData;

    _availableMeals = DUMMY_MEALS.where((meal) {
      if (_filters['gluten'] && !meal.isGlutenFree) {
        return false;
      }
      if (_filters['lactose'] && !meal.isLactoseFree) {
        return false;
      }
      if (_filters['vegan'] && !meal.isVegan) {
        return false;
      }
      if (_filters['vegetarian'] && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

  void _toggleFavorites(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool isFavorite(id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeals),
        MealDetailScreen.routeName: (ctx) =>
            MealDetailScreen(_toggleFavorites, isFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
      // ignore: missing_return
      onGenerateRoute: (settings) {
        // return MaterialPageRoute(builder: (Context) => CategoriesScreen());
        print(settings.arguments);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (Context) => CategoriesScreen());
      },
    );
  }
}
