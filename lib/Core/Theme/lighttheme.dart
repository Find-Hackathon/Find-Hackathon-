import 'package:flutter/material.dart';

import '../Constants/App/color.dart';
import 'textTheme.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: AppColors.kWhite,
  primaryColor: AppColors.kGreen,
  accentColor: AppColors.kBlack,
  scaffoldBackgroundColor: AppColors.kWhite,
  textTheme: robototexttheme,
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.transparent,
  ),
);
