import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final void Function(int index) onChanged;
  final int value;
  final IconData filledStar;
  final IconData unfilledStar;

  const StarRating({
    Key key,
    this.value = 0,
    this.filledStar,
    this.unfilledStar,
    this.onChanged,
  })  : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = 30.0;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return IconButton(
          onPressed: () {},
          color: index < value ? Colors.amber : null,
          iconSize: size,
          icon: Icon(
            index < value
                ? filledStar ?? Icons.star
                : unfilledStar ?? Icons.star_border,
          ),
          padding: EdgeInsets.zero,
          tooltip: "${index + 1} of 5",
        );
      }),
    );
  }
}
