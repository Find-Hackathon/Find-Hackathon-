import 'package:FindHackathon/Core/Constants/App/app_image.dart';
import 'package:FindHackathon/Views/Screen/Onboarding/onboarding_view.dart';
import 'package:FindHackathon/Views/Widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Core/Extension/context_extension.dart';
import '../../../Core/Utils/custom_linear_grediant.dart';
import '../../User.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences prefs;
  bool state;

  @override
  void initState() {
    _getUserState().then((state) {
      setState(() {
        this.state = state;
        print("state:" + state);
      });
    });
    getSharedPreferences();

    super.initState();
  }

  _getUserState() async {
    prefs = await SharedPreferences.getInstance();
    var state = prefs.getBool('isLoggedIn');
    return state;
  }

  getSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    print("isLoggedIn: " + prefs.getBool('isLoggedIn').toString());
    Future.delayed(const Duration(seconds: 3), () {
      if (prefs.getBool("isLoggedIn") != null) {
        User.userId = prefs.get("id");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NavigationBar()));
      }

      if (prefs.getBool('isLoggedIn') == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OnboardingHome()));
      }
    });
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
