import 'dart:convert';
import 'package:let_him_cook/data/api_functions.dart';
import 'package:let_him_cook/widgets/item_lists/back_button_and_name.dart';
import 'package:let_him_cook/widgets/item_lists/listview.dart';
import 'package:let_him_cook/widgets/item_lists/shimmer_on_listview.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:let_him_cook/screens/item_detail_screen.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/utils/screen_transition.dart';
import 'package:http/http.dart' as http;

class CategoryListScreen extends StatelessWidget {
  final String category;
  const CategoryListScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundGradient(),
      child: Scaffold(
        backgroundColor: transparentColor,
        body: SafeArea(
            child: Padding(
          padding: commonScreenPadding(context),
          child: Column(
            children: [
              BackButtonAndItemNameOnItemList(category: category),
              SizedBox(
                height: mediaqueryHeight(0.02, context),
              ),
              FutureBuilder<List<dynamic>>(
                future:ApiFunctions. fetchingIndividualCategoryItems(category),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ShimmerOnItemList();
                  }
                  return ListViewOnItemList(
                    snapshot: snapshot,
                  );
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}

