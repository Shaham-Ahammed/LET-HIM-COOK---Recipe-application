import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:let_him_cook/data/api_functions.dart';
import 'package:let_him_cook/databse/db_helper.dart';
import 'package:let_him_cook/databse/db_opertions.dart';
import 'package:let_him_cook/model/favorite_model.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/loading_indicator.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:http/http.dart' as http;
import 'package:let_him_cook/utils/valuenotifiers.dart';
import 'package:let_him_cook/widgets/item_details/functions/checking_favorite.dart';
import 'package:let_him_cook/widgets/item_details/item_name.dart';
import 'package:lottie/lottie.dart';

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

