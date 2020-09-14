import 'package:flutter/material.dart';

import '../Service/Navigation/navigation_service.dart';

abstract class BaseViewModel extends ChangeNotifier {
  final navigator = NavigatorService.instance;
  void init();
}
