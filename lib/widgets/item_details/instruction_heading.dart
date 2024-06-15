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

class InstructionHeading extends StatelessWidget {
  const InstructionHeading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: myFont("Instructions",
            fontFamily: josefin,
            fontSize: mediaqueryHeight(0.028, context),
            fontWeight: FontWeight.w600,
            fontColor: blackColor));
  }
}

