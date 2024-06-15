import 'package:flutter/material.dart';
import 'package:let_him_cook/databse/db_helper.dart';
import 'package:let_him_cook/databse/db_opertions.dart';
import 'package:let_him_cook/screens/item_detail_screen.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/loading_indicator.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/utils/screen_transition.dart';

class FavListName extends StatelessWidget {
  const FavListName({
    super.key,
    required this.item,
  });

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: mediaqueryWidth(0.54, context),
        child: myFont(item['name'],
            overflow: TextOverflow.ellipsis,
            fontFamily: josefin,
            fontSize: mediaqueryHeight(0.023, context),
            fontWeight: FontWeight.w500,
            fontColor: blackColor));
  }
}
