
import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';


class ItemName extends StatelessWidget {
  const ItemName({
    super.key,
    required this.item,
  });

  final Map<String, dynamic>? item;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            EdgeInsets.symmetric(horizontal: mediaqueryWidth(0.03, context)),
        width: mediaqueryWidth(
          0.7,
          context,
        ),
        child: Center(
          child: myFont(item!['strMeal'],
              fontFamily: patrickHand,
              overflow: TextOverflow.ellipsis,
              fontSize: mediaqueryHeight(0.04, context),
              fontWeight: FontWeight.w700,
              fontColor: blackColor),
        ));
  }
}

