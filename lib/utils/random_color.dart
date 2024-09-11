import 'dart:math';

import 'package:flutter/material.dart';

Color getRandomColor() {
  final random = Random();

  // List of predefined colors
  const List<Color> predefinedColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.orange,
    Colors.cyan,
    Colors.pink,
    Colors.teal,
    Colors.amber,
    Colors.indigo,
  ];

  // Select a random color from the predefined list
  return predefinedColors[random.nextInt(predefinedColors.length)];
}