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

class SearchBoxInHome extends StatelessWidget {
  const SearchBoxInHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(FadeTransitionPageRoute(child: SearchScreen()));
      },
      child: Container(
        width: double.infinity,
        height: mediaqueryHeight(0.06, context),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: blackColor, blurRadius: 8, offset: Offset(0, 6))
        ], color: greyColor2, borderRadius: BorderRadius.circular(90)),
        child: Row(
          children: [
            SizedBox(
              width: mediaqueryWidth(0.067, context),
            ),
            Icon(
              Icons.search,
              color: blackColor,
              size: mediaqueryHeight(0.034, context),
            ),
            SizedBox(
              width: mediaqueryWidth(0.05, context),
            ),
            myFont("Search by food name",
                fontFamily: josefin,
                fontSize: mediaqueryHeight(0.024, context),
                fontWeight: FontWeight.w500,
                fontColor: whiteColor),
            SizedBox(
              width: mediaqueryWidth(0.067, context),
            )
          ],
        ),
      ),
    );
  }
}