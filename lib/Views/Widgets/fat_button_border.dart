import 'package:flutter/material.dart';

import '../../Core/Extension/context_extension.dart';
import '../../Core/Extension/string_extension.dart';
import '../../Core/Utils/custom_box_shadow.dart';
import '../../Core/Utils/custom_linear_grediant.dart';

class FatButtonBorder extends StatelessWidget {
  final String text;
  final Function onPressed;
  const FatButtonBorder({
    Key key,
    this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.constHighValue),
          gradient: customLinearGradient(context.theme.backgroundColor),
          border: Border.all(width: 1, color: context.theme.primaryColor),
          boxShadow: [
            buildBoxShadow(context.theme.primaryColor),
          ]),
      child: FlatButton(
        onPressed: onPressed,
        child: Padding(
          padding: EdgeInsets.all(context.constMediumValue),
          child: Text(
            text.locale,
            style: context.textTheme.headline6
                .copyWith(color: context.theme.primaryColor),
          ),
        ),
      ),
    );
  }
}
