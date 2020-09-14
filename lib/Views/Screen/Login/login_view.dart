import 'package:FindHackathon/Core/Components/lottie_file.dart';
import 'package:FindHackathon/Core/Constants/App/app_lottie.dart';
import 'package:FindHackathon/Views/Widgets/outline_text_field.dart';
import 'package:FindHackathon/Views/Widgets/oval_appbar.dart';
import 'package:FindHackathon/Views/Widgets/space_seperator.dart';
import 'package:FindHackathon/Views/Widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/Extension/context_extension.dart';
import '../../../Core/Extension/string_extension.dart';
import '../../Widgets/fat_button.dart';
import 'login_view_model.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<LoginViewModel>(context);

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
              labelText: "Email",
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
              text: "signin",
              onPressed: () {
                if (viewModel.formKey.currentState.validate()) {
                  print(viewModel.email + "   " + viewModel.password);
                } else {
                  viewModel.validationChange(true);
                }
              },
            ),
            SpaceSeperator(),
            ButtonText(onPressed: () {}, text: "forgetPassword")
          ],
        ),
      ),
    );
  }
}
