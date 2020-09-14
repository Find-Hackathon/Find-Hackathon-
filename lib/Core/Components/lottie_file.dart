import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieFile extends StatelessWidget {
  final _path = "assets/lottie/";
  final String lottie;

  const LottieFile({Key key, this.lottie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(_path + lottie);
  }
}
