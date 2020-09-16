import 'package:FindHackathon/Core/Components/lottie_file.dart';
import 'package:FindHackathon/Core/Constants/App/app_lottie.dart';
import 'package:FindHackathon/Views/Screen/Detail/detail_view.dart';
import 'package:FindHackathon/Views/Screen/ForgotPassword/forgot_password.dart';
import 'package:FindHackathon/Views/Widgets/outline_text_field.dart';
import 'package:FindHackathon/Views/Widgets/oval_appbar.dart';
import 'package:FindHackathon/Views/Widgets/space_seperator.dart';
import 'package:FindHackathon/Views/Widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Core/Extension/context_extension.dart';
import '../../../Core/Extension/string_extension.dart';
import '../../User.dart';
import '../../Widgets/fat_button.dart';
import 'login_view_model.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel viewModel;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    // getSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<LoginViewModel>(context);
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: buildLoginForm(),
    );
  }

  // getSharedPreferences() async {
  //   prefs = await SharedPreferences.getInstance();
  //   if (prefs.getBool("isLoggedIn"))
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(builder: (context) => DetailView()),
  //     );
  // }

  Widget buildLoginForm() {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildOvalAppBar(),
          buildBody(),
        ],
      ),
    );
  }

  OvalAppBar buildOvalAppBar() {
    return OvalAppBar(
      text: "signin",
      height: context.height * .4,
      widget: LottieFile(
        lottie: AppLottie.programmingAnimation,
      ),
    );
  }

  Padding buildBody() {
    return Padding(
      padding: EdgeInsets.all(context.constMediumValue),
      child: Form(
        autovalidate: viewModel.validation,
        key: viewModel.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpaceSeperator(),
            OutlineTextField(
              labelText: "email".locale,
              validator: (value) =>
                  value.isValidEmail() ? null : "invalidEmail".locale,
              onChanged: (value) {
                viewModel.email = value;
              },
            ),
            SpaceSeperator(),
            OutlineTextField(
              labelText: "password".locale,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onChanged: (value) => viewModel.password = value,
              validator: (value) =>
              value.length > 6 ? null : "sixCharter".locale,
            ),
            SpaceSeperator(),
            FatButton(
              text: "signin".locale,
              onPressed: () async {
                if (viewModel.formKey.currentState.validate()) {
                  // print(viewModel.email + "   " + viewModel.password);

                  //LocaleManager.instance.setStringValue("email",viewModel.email);
                  // prefs.setString("email", viewModel.email);
                  // //LocaleManager.instance.setStringValue("email",viewModel.password);
                  // prefs.setString("password", viewModel.password);
                  // //LocaleManager.instance.setIsLoggedIn(state)
                  // prefs.setBool("isLoggedIn", true);
                  //
                  // print("is Logged in : " +
                  //     prefs.getBool("isLoggedIn").toString());
                  String id = await viewModel.firebaseLogin();
                  print(id);
                  if (id == null)
                    showErrorDialog();
                  else {
                    User.userId = id;
                    print(id);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailView()),
                    );
                  }
                } else {
                  viewModel.validationChange(true);
                }
              },
            ),
            SpaceSeperator(),
            ButtonText(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPassword()));
                },
                text: "forgetPassword".locale)
          ],
        ),
      ),
    );
  }

  Future<void> showErrorDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(milliseconds: 700), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            title: Text('HATALI GİRİŞ!'),
          );
        });
  }
}