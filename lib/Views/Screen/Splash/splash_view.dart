import 'package:FindHackathon/Core/Constants/App/app_image.dart';
import 'package:flutter/material.dart';

import '../../../Core/Extension/context_extension.dart';
import '../../../Core/Utils/custom_linear_grediant.dart';
import '../Login/login_view.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => LoginView(),
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: customLinearGradient(context.theme.primaryColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 150,
              child: Padding(
                padding: EdgeInsets.all(context.constLowValue),
                child: Image.asset(AppImage.splashLogo),
              ),
            ),
            Text(
              "HACKATHON \nFIND",
              textAlign: TextAlign.center,
              style: context.textTheme.headline3.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
