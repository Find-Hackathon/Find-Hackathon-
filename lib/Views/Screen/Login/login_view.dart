import 'package:FindHackathon/Views/Widgets/outline_text_field.dart';
import 'package:FindHackathon/Views/Widgets/space_seperator.dart';
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.constMediumValue),
      child: Form(
        autovalidate: viewModel.validation,
        key: viewModel.formKey,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "signin".locale,
              style: context.textTheme.headline4
                  .copyWith(color: context.theme.accentColor),
            ),
            SpaceSeperator(),
            OutlineTextField(
              labelText: "Email",
              validator: (value) =>
                  value.isValidEmail() ? null : "Invalid email",
              onChanged: (value) {
                viewModel.email = value;
              },
            ),
            SpaceSeperator(),
            OutlineTextField(
              labelText: "Password",
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onChanged: (value) => viewModel.password = value,
              validator: (value) =>
                  value.length > 6 ? null : "at least 6 characters",
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
          ],
        ),
      ),
    );
  }
}
