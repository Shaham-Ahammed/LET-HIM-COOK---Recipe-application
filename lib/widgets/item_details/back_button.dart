
import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/mediaquery.dart';


class ItemDetailsBackButton extends StatelessWidget {
  const ItemDetailsBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: greyColor2,
        ),
        padding: EdgeInsets.all(mediaqueryHeight(0.01, context)),
        child: Icon(
          Icons.keyboard_arrow_left_sharp,
          size: mediaqueryHeight(0.036, context),
          color: blackColor,
        ),
      ),
    );
  }
}

