import 'package:flutter/material.dart';
import 'package:let_him_cook/databse/db_helper.dart';
import 'package:let_him_cook/databse/db_opertions.dart';
import 'package:let_him_cook/screens/item_detail_screen.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/loading_indicator.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/utils/screen_transition.dart';

 BoxDecoration favListBoxDecoration(BuildContext context) {
    return BoxDecoration(boxShadow: [
      BoxShadow(
          color: greyColor,
          offset: Offset(0, mediaqueryHeight(0.005, context)),
          blurRadius: mediaqueryHeight(0.01, context)),
    ], color: amberColor, borderRadius: BorderRadius.circular(90));
  }