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

