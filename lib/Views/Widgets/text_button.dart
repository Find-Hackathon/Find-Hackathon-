import 'package:flutter/material.dart';

import '../../Core/Extension/context_extension.dart';
import '../../Core/Extension/string_extension.dart';

class ButtonText extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const ButtonText({
    Key key,
    this.onPressed,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Center(
          child: Text(
        text.locale,
        style: context.textTheme.button.copyWith(
            color: context.theme.primaryColor.withOpacity(.5),
            fontWeight: FontWeight.bold),
      )),
    );
  }
}
