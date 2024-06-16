
import 'package:flutter/material.dart';
import 'package:let_him_cook/databse/db_opertions.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/utils/valuenotifiers.dart';

class FavIconOnItemDetailScreen extends StatelessWidget {
  const FavIconOnItemDetailScreen({
    super.key,
    required this.item,
  });

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isFavorite,
      builder: (context, value, child) {
        if (value) {
          return GestureDetector(
            onTap: () {
              DbOperations().removeFromFav(item['idMeal'], context);
            },
            child: Icon(
              Icons.favorite_rounded,
              color: amberColor,
              size: mediaqueryHeight(0.04, context),
            ),
          );
        } else {
          return GestureDetector(
            onTap: () {
              DbOperations().addToFav(item['idMeal'], item['strMeal'],
                  item['strMealThumb'], context);
            },
            child: Icon(
              Icons.favorite_border_rounded,
              color: amberColor,
              size: mediaqueryHeight(0.04, context),
            ),
          );
        }
      },
    );
  }
}
