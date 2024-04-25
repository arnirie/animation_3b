import 'package:flutter/material.dart';

class Category {
  //constructor
  const Category({
    required this.id,
    required this.name,
    this.color = Colors.purple,
  });

  //properties
  final int id;
  final String name;
  final Color color;
}
