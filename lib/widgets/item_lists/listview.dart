import 'dart:convert';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:let_him_cook/screens/item_detail_screen.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/utils/screen_transition.dart';
import 'package:http/http.dart' as http;

class ListViewOnItemList extends StatelessWidget {
  const ListViewOnItemList({
    super.key,
    required this.snapshot,
  });
  final AsyncSnapshot<List<dynamic>> snapshot;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              final item = snapshot.data![index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(FadeTransitionPageRoute(
                      child: ItemDetailScreen(
                    id: item['idMeal'],
                  )));
                },
                child: Container(
                  width: double.infinity,
                  height: mediaqueryHeight(0.076, context),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: greyColor,
                            offset: Offset(0, mediaqueryHeight(0.005, context)),
                            blurRadius: mediaqueryHeight(0.01, context)),
                      ],
                      color: amberColor,
                      borderRadius: BorderRadius.circular(90)),
                  child: Row(
                    children: [
                      Container(
                        height: double.infinity,
                        width: mediaqueryWidth(0.17, context),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(item['strMealThumb'])),
                            color: amberColor,
                            borderRadius: BorderRadius.circular(90)),
                      ),
                      SizedBox(
                        width: mediaqueryWidth(0.02, context),
                      ),
                      Container(
                          width: mediaqueryWidth(0.64, context),
                          child: myFont(item['strMeal'],
                              overflow: TextOverflow.ellipsis,
                              fontFamily: josefin,
                              fontSize: mediaqueryHeight(0.023, context),
                              fontWeight: FontWeight.w500,
                              fontColor: blackColor))
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
            itemCount: snapshot.data!.length));
  }
}

