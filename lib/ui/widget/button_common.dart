import 'package:base_getx_project/res/color.dart';
import 'package:base_getx_project/res/style.dart';
import 'package:flutter/material.dart';

class ButtonCommon extends StatelessWidget {
  const ButtonCommon(
      {super.key,
      required this.onPressed,
      required this.text,
      this.textColor = Colors.white,
      this.backgroundColor = Colorz.primary});

  final VoidCallback onPressed;
  final String text;
  final Color textColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 52,
        decoration: BoxDecoration(
            color: backgroundColor, borderRadius: BorderRadius.circular(26.0)),
        child: Text(
          text,
          style: Styles.textYuGothic700(fontSize: 14),
        ),
      ),
    );
  }
}
