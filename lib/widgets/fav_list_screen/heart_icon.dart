import 'package:flutter/material.dart';
import 'package:let_him_cook/databse/db_helper.dart';
import 'package:let_him_cook/databse/db_opertions.dart';
import 'package:let_him_cook/screens/item_detail_screen.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/loading_indicator.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/utils/screen_transition.dart';

GestureDetector heartIcon(
    Map<String, dynamic> item, BuildContext context, VoidCallback callback) {
  return GestureDetector(
    onTap: () async {
      await DbOperations().removeFromFav(item['id'], context);
      callback();
    },
    child: Icon(
      Icons.favorite_rounded,
      color: Colors.red,
      size: mediaqueryHeight(0.04, context),
    ),
  );
}
