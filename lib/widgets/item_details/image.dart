
import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/mediaquery.dart';


class ItemImageOnItemDetailScreen extends StatelessWidget {
  const ItemImageOnItemDetailScreen({
    super.key,
    required this.item,
  });

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: mediaqueryHeight(0.17, context),
      backgroundColor: greyColor2,
      backgroundImage: NetworkImage(item['strMealThumb']),
    );
  }
}
