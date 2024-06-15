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

class OriginContainer extends StatelessWidget {
  const OriginContainer({
    super.key,
    required this.item,
  });

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaqueryWidth(1, context),
      height: mediaqueryHeight(0.07, context),
      decoration: BoxDecoration(
          color: amberColor, borderRadius: BorderRadius.circular(90)),
      child: Row(
        children: [
          Container(
            width: mediaqueryWidth(0.4, context),
            height: mediaqueryHeight(0.07, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              color: greyColor2,
            ),
            child: Center(
              child: myFont("Origin",
                  fontFamily: josefin,
                  fontSize: mediaqueryHeight(0.023, context),
                  fontWeight: FontWeight.w500,
                  fontColor: blackColor),
            ),
          ),
          Container(
            width: mediaqueryWidth(0.5, context),
            child: Center(
                child: myFont(item['strArea'],
                    overflow: TextOverflow.ellipsis,
                    fontFamily: josefin,
                    fontSize: mediaqueryHeight(0.025, context),
                    fontWeight: FontWeight.w500,
                    fontColor: blackColor)),
          )
        ],
      ),
    );
  }
}

