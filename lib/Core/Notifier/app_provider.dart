import 'package:FindHackathon/Views/Screen/Detail/detail_view_model.dart';
import 'package:FindHackathon/Views/Screen/ForgotPassword/forgot_password_view_model.dart';
import 'package:FindHackathon/Views/Screen/Register/register_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../Views/Screen/Login/login_view_model.dart';
import 'theme_provider.dart';

class AppProvider {
  static AppProvider _instance;

  static AppProvider get instance {
    if (_instance == null) _instance = AppProvider._init();
    return _instance;
  }

  AppProvider._init();

  List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => RegisterViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => ForgotPasswordViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => DetailViewModel(),
    ),
  ];
}
