import 'package:flutter/material.dart';
import '../components/category_tile.dart';
import '../data/back_data.dart';

class CategoryListScreen extends StatefulWidget {
  CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  final categoryList = CATEGORIES;

  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 500,
        // seconds: 4,
      ),
      lowerBound: 0,
      upperBound: 1,
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pinoy Recipes'),
        centerTitle: true,
        backgroundColor: Colors.purple,
        actions: [
          IconButton(
            onPressed: () {
              //start
              animationController.forward();
            },
            icon: Icon(Icons.play_arrow),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: animationController,
        builder: (context, child) {
          // return Padding(
          //   padding: EdgeInsets.only(top: 200 * animationController.value),
          //   child: child!,
          // );
          // return Opacity(
          //   opacity: 1 * animationController.value,
          //   child: child,
          // );
          // return SlideTransition(
          //   position: animationController.drive(
          //     Tween(
          //       begin: Offset(-1, -1),
          //       end: Offset(0, 0),
          //     ),
          //   ),
          //   child: child,
          // );
          // return SlideTransition(
          //   position: Tween<Offset>(
          //     begin: Offset(0, -1),
          //     end: Offset(0, 0),
          //   ).animate(
          //     CurvedAnimation(
          //         parent: animationController, curve: Curves.elasticInOut),
          //   ),
          //   child: child,
          // );
          // return FadeTransition(
          //   opacity: Tween<double>(begin: 1, end: 0).animate(
          //     CurvedAnimation(
          //         parent: animationController, curve: Curves.easeIn),
          //   ),
          //   child: child,
          // );
          // return SizeTransition(
          //   sizeFactor: CurvedAnimation(
          //     parent: animationController,
          //     curve: Curves.bounceOut,
          //   ),
          //   axis: Axis.horizontal,
          //   axisAlignment: -1,
          //   child: child,
          // );
          return ScaleTransition(
            scale: Tween<double>(begin: 0, end: 1).animate(
              CurvedAnimation(
                parent: animationController,
                curve: Curves.decelerate,
              ),
            ),
            alignment: Alignment.topCenter,
            child: child,
          );
        },
        child: GridView(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3 / 2,
          ),
          children: categoryList.map((elem) {
            return CategoryTile(
              category: elem,
            );
          }).toList(),
        ),
      ),
    );
  }
}
