import 'package:FindHackathon/Core/Components/lottie_file.dart';
import 'package:FindHackathon/Core/Constants/App/app_lottie.dart';
import 'package:FindHackathon/Views/Screen/Login/login_view.dart';
import 'package:FindHackathon/Views/Screen/Register/register_view_model.dart';
import 'package:FindHackathon/Views/Widgets/outline_text_field.dart';
import 'package:FindHackathon/Views/Widgets/oval_appbar.dart';
import 'package:FindHackathon/Views/Widgets/space_seperator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Core/Extension/context_extension.dart';
import '../../../Core/Extension/string_extension.dart';
import '../../Widgets/fat_button.dart';

class RegisterView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<RegisterView> {
  RegisterViewModel viewModel;
  SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    // getSharedPreferences();
  }

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<RegisterViewModel>(context);
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: buildLoginForm(),
    );
  }

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
      text: "register",
      height: context.height * .3,
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
              labelText: "name".locale,
              onChanged: (value) {
                viewModel.name = value;
              },
              validator: (value) =>
                  value.length > 3 ? null : "threeCharter".locale,
            ),
            SpaceSeperator(),
            OutlineTextField(
              labelText: "username".locale,
              onChanged: (value) {
                viewModel.username = value;
              },
              validator: (value) =>
                  value.length > 3 ? null : "threeCharter".locale,
            ),
            SpaceSeperator(),
            OutlineTextField(
              labelText: "email".locale,
              onChanged: (value) {
                viewModel.email = value;
              },
              validator: (value) =>
                  value.isValidEmail() ? null : "invalidEmail".locale,
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
            OutlineTextField(
              labelText: "confirmPassword".locale,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onChanged: (value) => viewModel.confirmPassword = value,
              validator: (value) =>
                  value.length > 6 ? null : "sixCharter".locale,
            ),
            SpaceSeperator(),
            FatButton(
              text: "signin".locale,
              onPressed: () {
                if (viewModel.formKey.currentState.validate()) {
                  viewModel.firebaseUserCreate();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginView()),
                  );
                } else {
                  viewModel.validationChange(true);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
