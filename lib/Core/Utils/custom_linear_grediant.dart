import 'package:flutter/material.dart';

LinearGradient customLinearGradient(Color color) {
  return LinearGradient(
    colors: [
      color.withOpacity(.6),
      color,
    ],
    stops: [0.2, 1],
    begin: Alignment.topLeft,
    end: Alignment.centerRight,
  );
}
