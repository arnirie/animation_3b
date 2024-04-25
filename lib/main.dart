import 'package:flutter/material.dart';
import 'screens/category_list.dart';
import 'screens/recipe_list.dart';

void main() {
  runApp(const PinoyRecipes());
}

//TODO:
//DONE-1) Categories (i.e. Kapampangan, Illongo, Ilocano)
//DONE-2) Category listing screen
//DONE-3) Recipe (Bicol Express)
//!4) Recipe listing screen per category
//5) Recipe viewing screen

//TOPICS:
//GridView, Data Class, Navigation

class PinoyRecipes extends StatelessWidget {
  const PinoyRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryListScreen(),
    );
  }
}
