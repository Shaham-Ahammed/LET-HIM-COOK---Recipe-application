import 'package:flutter/material.dart';

mediaqueryHeight(double x, BuildContext context) {
  return MediaQuery.of(context).size.height * x;
}

mediaqueryWidth(double x, BuildContext context) {
  return MediaQuery.of(context).size.width * x;
}
