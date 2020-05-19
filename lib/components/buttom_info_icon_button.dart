import 'package:flutter/material.dart';
import 'package:covfiguresapp/constants.dart';

class BottomInfoIconButton extends StatelessWidget {
  const BottomInfoIconButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: IconButton(
        iconSize: 50,
        color: kBackgroundColor,
        icon: const Icon(Icons.info_outline),
        onPressed: () {},
      ),
    );
  }
}
