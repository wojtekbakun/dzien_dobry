import 'package:flutter/material.dart';

class MyPaddings {
  static const double small = 8.0;
  static const double medium = 16.0;
  static const double large = 24.0;

  static const EdgeInsets smallAll = EdgeInsets.all(small);
  static const EdgeInsets mediumAll = EdgeInsets.all(medium);
  static const EdgeInsets largeAll = EdgeInsets.all(large);

  static const EdgeInsets symmetricHorizontal =
      EdgeInsets.symmetric(horizontal: large);
  static const EdgeInsets onlyTop = EdgeInsets.only(top: large);

  static const EdgeInsets weatherDotsHorizontal =
      EdgeInsets.symmetric(horizontal: small);
}
