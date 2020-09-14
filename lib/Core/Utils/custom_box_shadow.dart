import 'package:flutter/material.dart';

BoxShadow buildBoxShadow(Color color) {
  return BoxShadow(
      color: color.withOpacity(.3),
      offset: Offset(45, 20),
      blurRadius: 50,
      spreadRadius: 25);
}
