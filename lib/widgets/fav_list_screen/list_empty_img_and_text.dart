import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';

class FavEmptyImageAndText extends StatelessWidget {
  const FavEmptyImageAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: mediaqueryHeight(0.17, context),
        ),
        Image.asset(
          "assets/images/bonbon-fast-food-combo-set-fries-burger-sauce-and-soda.png",
        ),
        myFont("Your favorites list is waiting!\n Start adding now.",
            textalign: TextAlign.center,
            fontFamily: josefin,
            fontSize: mediaqueryHeight(0.025, context),
            fontWeight: FontWeight.w600,
            fontColor: blackColor)
      ],
    );
  }
}
