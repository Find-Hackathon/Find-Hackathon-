import 'package:FindHackathon/Core/Extension/context_extension.dart';
import 'package:FindHackathon/Views/Screen/ForgotPassword/forgot_password_view_model.dart';
import 'package:FindHackathon/Views/Screen/Login/login_view.dart';
import 'package:FindHackathon/Views/Widgets/fat_button.dart';
import 'package:FindHackathon/Views/Widgets/outline_text_field.dart';
import 'package:FindHackathon/Views/Widgets/space_seperator.dart';
import 'package:FindHackathon/Views/Widgets/text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Core/Extension/string_extension.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  ForgotPasswordViewModel viewModel;
  String email;

  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<ForgotPasswordViewModel>(context);
    return Scaffold(
      // backgroundColor: Colors.greenAccent.withOpacity(0.2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Expanded(
              child: Row(
            children: [
              IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black,
                  onPressed: () {}),
              Spacer(),
              // Text("Forgot Password")
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ))
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(context.constMediumValue),
          child: Form(
            autovalidate: viewModel.validation,
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Enter your email and we will send you a link to reset your password",
                  style: TextStyle(
                      fontSize: context.constMediumValue,
                      fontWeight: FontWeight.bold),
                ),
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
                FatButton(
                  text: "Send",
                  onPressed: () {
                    _showDialog();
                  },
                ),
                SpaceSeperator(),
                SpaceSeperator(),
                ButtonText(
                    onPressed: () {
                      Navigator.pop(context,
                          MaterialPageRoute(builder: (context) => LoginView()));
                    },
                    text: "Back to Login")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Link Gönderildi.'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Emailine şifreni yenilemen için bir link gönderdik. 5 dakika içinde gelmezse yeniden dene'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Anladım'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
