import 'package:flutter/material.dart';
import 'package:let_him_cook/databse/db_helper.dart';
import 'package:let_him_cook/databse/db_opertions.dart';
import 'package:let_him_cook/screens/item_detail_screen.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/loading_indicator.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/utils/screen_transition.dart';

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
