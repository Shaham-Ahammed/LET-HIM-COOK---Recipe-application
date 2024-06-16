import 'package:flutter/material.dart';
import 'package:let_him_cook/databse/db_opertions.dart';
import 'package:let_him_cook/utils/mediaquery.dart';

GestureDetector heartIcon(
    Map<String, dynamic> item, BuildContext context, VoidCallback callback) {
  return GestureDetector(
    onTap: () async {
      await DbOperations().removeFromFav(item['id'], context);
      callback();
    },
    child: Icon(
      Icons.favorite_rounded,
      color: Colors.red,
      size: mediaqueryHeight(0.04, context),
    ),
  );
}
