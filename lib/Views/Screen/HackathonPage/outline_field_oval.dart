import 'package:FindHackathon/Core/Extension/context_extension.dart';
import 'package:flutter/material.dart';

class OutlieField extends StatelessWidget {
  final String labelText;
  final Function(String data) onChanged;

  const OutlieField({
    Key key,
    @required this.labelText,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
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
