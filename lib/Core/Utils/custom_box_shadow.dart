import 'package:flutter/material.dart';

BoxShadow buildBoxShadow(Color color) {
  return BoxShadow(
    color: color.withOpacity(0.5),
    offset: Offset(1, 1),
    blurRadius: 5,
    spreadRadius: 2,
  );
}
