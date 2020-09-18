import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../../Core/Extension/context_extension.dart';

class SettingButton extends StatelessWidget {
  final bool bigSizeBorder;
  final VoidCallback onPressed;
  final String text;
  const SettingButton({
    Key key,
    @required this.bigSizeBorder,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        width: context.width * .2,
        padding: EdgeInsets.symmetric(vertical: context.constLowValue),
        decoration: bigSizeBorder
            ? buildBoxDecorationHight(context)
            : buildBoxDecorationLow(context),
        child: Text(
          text,
          style: context.textTheme.bodyText1
              .copyWith(color: context.theme.backgroundColor),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecorationHight(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(context.constMediumValue),
      border: Border.all(width: 3, color: context.theme.backgroundColor),
    );
  }

  BoxDecoration buildBoxDecorationLow(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(context.constMediumValue),
      border: Border.all(
          width: 1, color: context.theme.backgroundColor.withOpacity(.7)),
    );
  }
}
