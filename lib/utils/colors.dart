import 'package:flutter/material.dart';

const Color whiteColor = Colors.white;
const Color blackColor = Colors.black;
const Color greyColor = Color.fromRGBO(153, 153, 153, 1);
const Color greyColor2 = Color.fromRGBO(217, 217, 217, 1);
const Color amberColor = Color.fromRGBO(251, 158, 25, 1);
const Color transparentColor = Colors.transparent;

BoxDecoration backgroundGradient() {
  return const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [whiteColor, greyColor]));
}
