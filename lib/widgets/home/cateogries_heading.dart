 import 'dart:convert';
import 'package:let_him_cook/screens/fav_list_screen.dart';
import 'package:let_him_cook/screens/item_detail_screen.dart';
import 'package:let_him_cook/screens/search_screen.dart';
import 'package:let_him_cook/widgets/home/cateogries_heading.dart';
import 'package:let_him_cook/widgets/home/fav_container.dart';
import 'package:let_him_cook/widgets/home/gridview_items.dart';
import 'package:let_him_cook/widgets/home/search_box.dart';
import 'package:let_him_cook/widgets/home/shimmer_gridview.dart';
import 'package:let_him_cook/widgets/home/surprise_recipe_container.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:let_him_cook/screens/item_list.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/utils/screen_transition.dart';
import 'package:http/http.dart' as http;

 categoriesHeading(BuildContext context) {
   return myFont("CATEGORIES",
        fontFamily: patrickHand,
        fontSize: mediaqueryHeight(0.03, context),
        fontWeight: FontWeight.w700,
        fontColor: blackColor);
  }