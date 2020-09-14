import 'package:FindHackathon/Core/Extension/context_extension.dart';
import 'package:FindHackathon/Core/Extension/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [buildLoginForm()],
      ),
    );
  }

  Widget buildLoginForm() {
    return Expanded(
      child: Container(
        color: context.theme.backgroundColor,
        child: Container(
          child: Form(
            autovalidate: viewModel.validation,
            key: viewModel.formKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login".locale,
                  style: Theme.of(context).textTheme.headline4,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) =>
                      value.isValidEmail() ? null : "Invalid email",
                  onChanged: (value) {
                    viewModel.email = value;
                  },
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.mail_outline),
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onChanged: (value) => viewModel.password = value,
                  validator: (value) =>
                      value.length > 6 ? null : "at least 6 characters",
                  decoration: InputDecoration(
                      labelText: "Password",
                      prefixIcon: Icon(
                        Icons.vpn_key,
                        color: context.theme.primaryColor,
                      )),
                ),
                FlatButton(
                  onPressed: () {
                    if (viewModel.formKey.currentState.validate()) {
                      print(viewModel.email + "   " + viewModel.password);
                    } else {
                      viewModel.validationChange(true);
                    }
                  },
                  child: Text(
                    "Sign in",
                    style: context.textTheme.headline6
                        .copyWith(color: context.theme.accentColor),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: context.theme.accentColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
