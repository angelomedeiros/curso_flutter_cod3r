import 'package:flutter/material.dart';
import 'package:projeto_foods/components/meal_item.dart';
import 'package:projeto_foods/data/dummy_data.dart';
import 'package:projeto_foods/models/category.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as Category;
    final categoryMeals = [
      ...DUMMY_MEALS.where((meal) => meal.categories.contains(category.id))
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (context, index) => MealItem(categoryMeals[index]),
      ),
    );
  }
}
