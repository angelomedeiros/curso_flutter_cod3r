import 'package:flutter/material.dart';
import 'package:projeto_foods/screens/categories_meals_screen.dart';
import 'package:projeto_foods/screens/categories_screen.dart';
import 'package:projeto_foods/screens/meal_detail_screen.dart';
import 'package:projeto_foods/screens/tabs_screen.dart';
import 'package:projeto_foods/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos cozinhar??',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
      ),
      routes: {
        AppRoutes.HOME: (context) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (context) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (context) => MealDetailScreen(),
      },
      // onUnknownRoute: (settings) =>
      //     MaterialPageRoute(builder: (_) => CategoriesScreen()),
    );
  }
}
