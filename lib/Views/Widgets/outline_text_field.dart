import 'package:FindHackathon/Core/Extension/context_extension.dart';
import 'package:flutter/material.dart';

class OutlineTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final Function(String data) onChanged;
  final Function(String data) validator;
  final bool obscureText;
  final String labelText;

  const OutlineTextField({
    Key key,
    this.keyboardType = TextInputType.emailAddress,
    this.onChanged,
    this.validator,
    this.labelText,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      validator: validator,
      obscureText: obscureText,
      onChanged: onChanged,
      cursorColor: context.theme.primaryColor,
      decoration: InputDecoration(
        labelStyle: context.textTheme.bodyText2
            .copyWith(color: context.theme.primaryColor),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: context.theme.primaryColor),
            borderRadius: BorderRadius.circular(context.constHighValue)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(context.constHighValue)),
        labelText: labelText,
      ),
    );
  }
}
