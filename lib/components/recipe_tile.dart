import 'package:flutter/material.dart';
import '../models/recipe.dart';
import '../screens/recipe_view.dart';

class RecipeTile extends StatelessWidget {
  RecipeTile(this.recipe, {super.key});

  Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => RecipeViewScreen(recipe)),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                AspectRatio(
                  aspectRatio: 3 / 2,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                    child: recipe.imageUrl == null
                        ? Text('No Image')
                        : Image.network(
                            recipe.imageUrl!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    color: Colors.black54,
                    child: Text(
                      recipe.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.timer),
                  const SizedBox(
                    width: 4,
                  ),
                  Text('${recipe.duration} minute(s)'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
