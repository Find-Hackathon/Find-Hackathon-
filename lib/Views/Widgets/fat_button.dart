import 'package:FindHackathon/Core/Extension/string_extension.dart';
import 'package:flutter/material.dart';

import '../../Core/Extension/context_extension.dart';

class FatButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const FatButton({
    Key key,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: context.theme.primaryColor.withOpacity(.4),
            offset: Offset(45, 20),
            blurRadius: 50,
            spreadRadius: 25)
      ]),
      child: FlatButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(context.constMediumValue),
          child: Text(
            text.locale,
            style: context.textTheme.headline6
                .copyWith(color: context.theme.backgroundColor),
          ),
        ),
        color: context.theme.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(context.constHighValue),
        ),
      ),
    );
  }
}
