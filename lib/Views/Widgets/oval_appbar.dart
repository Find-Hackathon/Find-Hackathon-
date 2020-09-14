import 'package:FindHackathon/Core/Utils/custom_linear_grediant.dart';
import 'package:flutter/material.dart';

import '../../Core/Extension/context_extension.dart';
import '../../Core/Extension/string_extension.dart';

class OvalAppBar extends StatelessWidget {
  final String text;
  final double height;
  final Widget widget;
  const OvalAppBar({
    Key key,
    @required this.text,
    this.height,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.all(context.constMediumValue),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(context.constHighValue),
        ),
        gradient: customLinearGradient(context.theme.primaryColor),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: height * .75,
              child: widget ?? SizedBox.shrink(),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              text.locale,
              style: context.textTheme.headline4
                  .copyWith(color: context.theme.backgroundColor),
            ),
          ),
        ],
      ),
    );
  }
}
