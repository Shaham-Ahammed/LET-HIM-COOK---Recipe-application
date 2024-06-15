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

class GridViewCategories extends StatelessWidget {
  final AsyncSnapshot<List<dynamic>> snapshot;
  const GridViewCategories({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: .7,
          crossAxisSpacing: mediaqueryWidth(0.03, context),
          crossAxisCount: 3),
      itemBuilder: (context, index) {
        final item = snapshot.data![index];
        return Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(FadeTransitionPageRoute(
                    child: CategoryListScreen(
                  category: item['strCategory'],
                )));
              },
              child: CircleAvatar(
                
                backgroundImage: NetworkImage(item["strCategoryThumb"]),
                backgroundColor: greyColor2,
                radius: mediaqueryHeight(0.06, context),
              ),
            ),
            SizedBox(
              height: mediaqueryHeight(0.01, context),
            ),
            myFont(item['strCategory'],
                fontFamily: josefin,
                fontSize: mediaqueryHeight(0.02, context),
                fontWeight: FontWeight.w500,
                fontColor: blackColor)
          ],
        );
      },
      itemCount: snapshot.data!.length,
    ));
  }
}