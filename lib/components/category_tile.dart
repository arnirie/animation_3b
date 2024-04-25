import 'package:flutter/material.dart';
import '../models/category.dart';
import '../screens/recipe_list.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({super.key, required this.category});

  Category category;
  // String text;
  // Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(category.name);
        //go to the recipe_list screen
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => RecipeListScreen(
                      category: category,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color,
              category.color.withOpacity(0.55),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        child: Text(
          category.name,
          style: const TextStyle(
            fontSize: 28, fontWeight: FontWeight.w300,
            // color: Colors.white,
          ),
        ),
      ),
    );
  }
}
