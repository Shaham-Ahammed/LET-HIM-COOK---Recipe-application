import 'package:let_him_cook/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/utils/screen_transition.dart';

class SearchBoxInHome extends StatelessWidget {
  const SearchBoxInHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(FadeTransitionPageRoute(child: const SearchScreen()));
      },
      child: Container(
        width: double.infinity,
        height: mediaqueryHeight(0.06, context),
        decoration: BoxDecoration(boxShadow: const [
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