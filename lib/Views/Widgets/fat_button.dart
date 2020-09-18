import 'package:flutter/material.dart';

import '../../Core/Extension/context_extension.dart';
import '../../Core/Extension/string_extension.dart';
import '../../Core/Utils/custom_box_shadow.dart';
import '../../Core/Utils/custom_linear_grediant.dart';

class FatButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isActive;
  const FatButton({
    Key key,
    this.text,
    this.onPressed,
    this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.constHighValue),
          gradient: customLinearGradient(context.theme.primaryColor),
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
                .copyWith(color: context.theme.backgroundColor),
          ),
        ),
      ),
    );
  }
}
