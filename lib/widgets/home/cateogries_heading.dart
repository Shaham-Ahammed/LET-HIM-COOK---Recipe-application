import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';

 categoriesHeading(BuildContext context) {
   return myFont("CATEGORIES",
        fontFamily: patrickHand,
        fontSize: mediaqueryHeight(0.03, context),
        fontWeight: FontWeight.w700,
        fontColor: blackColor);
  }