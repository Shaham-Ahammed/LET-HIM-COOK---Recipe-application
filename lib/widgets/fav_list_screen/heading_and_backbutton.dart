import 'package:flutter/material.dart';
import 'package:let_him_cook/databse/db_helper.dart';
import 'package:let_him_cook/databse/db_opertions.dart';
import 'package:let_him_cook/screens/item_detail_screen.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/loading_indicator.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/utils/screen_transition.dart';

class FavListHeadingAndBackButton extends StatelessWidget {
  const FavListHeadingAndBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new)),
        Center(
            child: myFont("Favorites",
                fontFamily: patrickHand,
                fontSize: mediaqueryHeight(0.04, context),
                fontWeight: FontWeight.w700,
                fontColor: blackColor)),
        Container()
      ],
    );
  }
}
