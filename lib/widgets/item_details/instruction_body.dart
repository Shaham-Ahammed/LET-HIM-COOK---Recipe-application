
import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';


class InstructionBody extends StatelessWidget {
  const InstructionBody({
    super.key,
    required this.item,
  });

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaqueryWidth(1, context),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
      child: myFont(item['strInstructions'],
          fontFamily: josefin,
          fontSize: mediaqueryHeight(0.02, context),
          fontWeight: FontWeight.w400,
          fontColor: blackColor),
    );
  }
}

