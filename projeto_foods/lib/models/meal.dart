import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Medium,
  Difficult,
}

enum Cost {
  Cheap,
  Fair,
  Expensive,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageURL;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageURL,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.complexity,
    @required this.cost,
  });

  String get complexityText {
    final Map<Complexity, String> _complexityText = {
      Complexity.Simple: 'Simples',
      Complexity.Difficult: 'Difícil',
      Complexity.Medium: 'Normal',
    };

    return _complexityText[complexity] ?? 'Desconhecida';
  }

  String get costText {
    final Map<Cost, String> _costText = {
      Cost.Cheap: 'Barato',
      Cost.Fair: 'Justo',
      Cost.Expensive: 'Caro',
    };

    return _costText[cost] ?? 'Desconhecido';
  }
}
