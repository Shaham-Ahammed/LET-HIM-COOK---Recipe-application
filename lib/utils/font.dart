import 'package:flutter/material.dart';

const String patrickHand = "PatrickHand";
const String josefin ="Josefin";

myFont(String text,
    {required String fontFamily,
    required double fontSize,
    TextOverflow? overflow,
    required FontWeight fontWeight,
    required Color fontColor,
    TextAlign textalign = TextAlign.start}) {
  return Text(
    text,
    textAlign: textalign,
    style: TextStyle(
        overflow: overflow,
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: fontColor),
  );
}