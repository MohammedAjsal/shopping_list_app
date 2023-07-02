import 'package:flutter/material.dart';

enum Categories {
  diary,
  meat,
  vegetables,
  dairy,
  fruit,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other
}

class Category {
  const Category(this.title, this.color);
  final String title;
  final Color color;
}
