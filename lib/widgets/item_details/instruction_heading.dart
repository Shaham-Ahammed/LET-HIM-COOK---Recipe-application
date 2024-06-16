
import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';


class InstructionHeading extends StatelessWidget {
  const InstructionHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: myFont("Instructions",
            fontFamily: josefin,
            fontSize: mediaqueryHeight(0.028, context),
            fontWeight: FontWeight.w600,
            fontColor: blackColor));
  }
}

