import 'package:FindHackathon/Views/Home/home_view.dart';
import 'package:FindHackathon/Views/Screen/ChatUserList/chat_user_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Core/Notifier/app_provider.dart';
import 'Core/Notifier/theme_provider.dart';
import 'Core/Service/Localization/language_service.dart';
import 'Core/Service/Navigation/navigation_service.dart';
import 'Views/Screen/Splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    EasyLocalization(
        path: LanguageService.path,
        saveLocale: true,
        supportedLocales: LanguageService.instance.locales,
        child: MultiProvider(
            providers: AppProvider.instance.providers, child: MyApp())),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      navigatorKey: NavigatorService.instance.navigatorKey,
      theme: Provider.of<ThemeProvider>(context).getTheme,
      home: SplashScreen(),
    );
  }
}
