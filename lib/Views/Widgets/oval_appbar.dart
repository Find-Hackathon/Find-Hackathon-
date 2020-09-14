import 'package:FindHackathon/Core/Utils/custom_linear_grediant.dart';
import 'package:flutter/material.dart';

import '../../Core/Extension/context_extension.dart';
import '../../Core/Extension/string_extension.dart';

class OvalAppBar extends StatelessWidget {
  final String text;
  const OvalAppBar({
    Key key,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.constMediumValue),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(context.constHighValue),
        ),
        gradient: customLinearGradient(context.theme.primaryColor),
      ),
      child: Text(
        text.locale,
        style: context.textTheme.headline4
            .copyWith(color: context.theme.backgroundColor),
      ),
    );
  }
}
