import 'package:flutter/material.dart';

import '../constants/index.dart';

class TextStyles {
  static TextStyle productNameTextStyle = const TextStyle(
    fontSize: Sizing.s18,
    fontWeight: FontWeight.bold,
  );
  static TextStyle descriptionTextStyle = TextStyle(
    fontSize: Sizing.s14,
    color: Colors.grey[600],
  );

  static TextStyle priceTextStyle = const TextStyle(
    fontSize: Spacing.s16,
    fontWeight: FontWeight.bold,
    color: Colors.green,
  );
}
