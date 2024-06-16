import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/mediaquery.dart';

class FavListImage extends StatelessWidget {
  const FavListImage({
    super.key,
    required this.item,
  });

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: mediaqueryWidth(0.17, context),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: NetworkImage(item['imageUrl'])),
          color: amberColor,
          borderRadius: BorderRadius.circular(90)),
    );
  }
}

