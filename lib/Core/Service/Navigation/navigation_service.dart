import 'package:flutter/material.dart';

class NavigatorService {
  static NavigatorService _instance = NavigatorService._init();
  static NavigatorService get instance => _instance;

  NavigatorService._init();

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Future<dynamic> navigateTo(Widget route) {
    return _navigatorKey.currentState
        .push(MaterialPageRoute(builder: (BuildContext context) => route));
  }

  Future<dynamic> navigateToReplace(Widget route) {
    return _navigatorKey.currentState.pushReplacement(
        MaterialPageRoute(builder: (BuildContext context) => route));
  }
}
