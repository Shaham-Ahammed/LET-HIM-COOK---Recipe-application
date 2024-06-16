import 'package:let_him_cook/screens/item_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/utils/screen_transition.dart';

class SurpriseRecipeContainer extends StatelessWidget {
  const SurpriseRecipeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(FadeTransitionPageRoute(child: const ItemDetailScreen()));
      },
      child: Container(
        width: mediaqueryWidth(0.55, context),
        height: mediaqueryHeight(0.15, context),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: greyColor,
              blurRadius: 2,
              offset: Offset(mediaqueryHeight(0.0, context),
                  mediaqueryHeight(0.01, context)))
        ], color: amberColor, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            myFont("CONFUSED !",
                fontFamily: patrickHand,
                fontSize: mediaqueryHeight(0.026, context),
                fontWeight: FontWeight.w600,
                fontColor: blackColor),
            myFont("suggest me with a\nsurprise recipe",
                fontFamily: josefin,
                fontSize: mediaqueryHeight(0.022, context),
                fontWeight: FontWeight.w400,
                fontColor: whiteColor)
          ],
        ),
      ),
    );
  }
}