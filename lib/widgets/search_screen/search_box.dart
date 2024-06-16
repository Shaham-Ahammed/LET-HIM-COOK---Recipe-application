import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';

Container searchWidgetOnSearchScreen(BuildContext context, FocusNode focusNode,
    VoidCallback Function(String value) callBack) {
  return Container(
    width: double.infinity,
    height: mediaqueryHeight(0.06, context),
    decoration: BoxDecoration(boxShadow: const [
      BoxShadow(color: blackColor, blurRadius: 4, offset: Offset(0, 4))
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
        Expanded(
          child: TextField(
            focusNode: focusNode,
            onChanged: (value) {
              callBack(value);
            },
            cursorColor: amberColor,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Search by food name",
                hintStyle: TextStyle(
                    color: whiteColor,
                    fontFamily: josefin,
                    fontSize: mediaqueryHeight(0.024, context))),
          ),
        ),
        SizedBox(
          width: mediaqueryWidth(0.067, context),
        ),
      ],
    ),
  );
}
