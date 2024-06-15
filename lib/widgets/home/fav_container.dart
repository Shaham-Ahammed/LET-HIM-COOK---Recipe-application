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

class FavContainer extends StatelessWidget {
  const FavContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(FadeTransitionPageRoute(child: FavListScreen()));
      },
      child: Container(
        width: mediaqueryWidth(0.25, context),
        height: mediaqueryHeight(0.15, context),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: greyColor,
              blurRadius: 2,
              offset: Offset(mediaqueryHeight(0.0, context),
                  mediaqueryHeight(0.01, context)))
        ], color: amberColor, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_rounded,
              size: mediaqueryHeight(0.040, context),
              color: Colors.red,
            ),
            SizedBox(
              height: mediaqueryHeight(0.01, context),
            ),
            myFont("Fav",
                fontFamily: josefin,
                fontSize: mediaqueryHeight(0.022, context),
                fontWeight: FontWeight.w400,
                fontColor: whiteColor),
          ],
        ),
      ),
    );
  }
}