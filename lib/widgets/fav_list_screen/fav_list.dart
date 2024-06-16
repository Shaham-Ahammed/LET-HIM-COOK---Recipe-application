import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/widgets/fav_list_screen/box_decoartion.dart';
import 'package:let_him_cook/widgets/fav_list_screen/heart_icon.dart';
import 'package:let_him_cook/widgets/fav_list_screen/item_image.dart';
import 'package:let_him_cook/widgets/fav_list_screen/item_name.dart';

ListView favLists(
    List<dynamic> favList, VoidCallback callback1, VoidCallback callback2) {
  return ListView.separated(
      itemBuilder: (context, index) {
        final item = favList[index];
        return GestureDetector(
          onTap: () {
            callback2;
          },
          child: Container(
            width: double.infinity,
            height: mediaqueryHeight(0.076, context),
            decoration: favListBoxDecoration(context),
            child: Row(
              children: [
                FavListImage(item: item),
                SizedBox(
                  width: mediaqueryWidth(0.02, context),
                ),
                FavListName(item: item),
                SizedBox(
                  width: mediaqueryWidth(0.05, context),
                ),
                heartIcon(item, context, callback1)
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: mediaqueryHeight(0.023, context),
        );
      },
      itemCount: favList.length);
}
