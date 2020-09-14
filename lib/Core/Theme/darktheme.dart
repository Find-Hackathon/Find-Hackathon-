import 'package:flutter/material.dart';

import '../Constants/App/color.dart';
import 'textTheme.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  backgroundColor: AppColors.kBlack,
  primaryColor: AppColors.kWhite,
  accentColor: AppColors.kYellow,
  scaffoldBackgroundColor: AppColors.kBlack,
  textTheme: robototexttheme,
);
