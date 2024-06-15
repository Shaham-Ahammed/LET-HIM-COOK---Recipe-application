import 'dart:convert';
import 'package:let_him_cook/data/api_functions.dart';
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

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundGradient(),
      child: Scaffold(
        backgroundColor: transparentColor,
        body: SafeArea(
          child: Padding(
            padding: commonScreenPadding(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBoxInHome(),
                SizedBox(
                  height: mediaqueryHeight(0.027, context),
                ),
                Row(
                  children: [
                    SurpriseRecipeContainer(),
                    SizedBox(width: mediaqueryWidth(0.07, context)),
                    FavContainer(),
                  ],
                ),
                SizedBox(
                  height: mediaqueryHeight(0.03, context),
                ),
                categoriesHeading(context),
                SizedBox(
                  height: mediaqueryHeight(0.03, context),
                ),
                FutureBuilder<List<dynamic>>(
                  future:ApiFunctions.fetchingCategories(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ShimmerOnHomeScreenForCategories();
                    }
                    return GridViewCategories(
                      snapshot: snapshot,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

 
}





