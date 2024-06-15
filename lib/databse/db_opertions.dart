import 'package:flutter/material.dart';
import 'package:let_him_cook/databse/db_helper.dart';
import 'package:let_him_cook/model/favorite_model.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/utils/valuenotifiers.dart';

class DbOperations {
  addToFav(
      String id, String name, String imagePath, BuildContext context) async {
    final FavModel model = FavModel(id: id, name: name, imagePath: imagePath);
    await DbHelper.createData(model);
    isFavorite.value = true;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: Duration(seconds: 1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          backgroundColor: amberColor,
          content: Center(
              child: myFont("added to favorites 🖤",
                  fontFamily: patrickHand,
                  fontSize: mediaqueryHeight(0.023, context),
                  fontWeight: FontWeight.w500,
                  fontColor: blackColor))),
    );
  }

  removeFromFav(String id, BuildContext context) async {
    await DbHelper.deleteData(id);
    isFavorite.value = false;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          duration: Duration(seconds: 1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          backgroundColor: amberColor,
          content: Center(
              child: myFont("removed from favorites",
                  fontFamily: patrickHand,
                  fontSize: mediaqueryHeight(0.023, context),
                  fontWeight: FontWeight.w500,
                  fontColor: blackColor))),
    );
  }
}
