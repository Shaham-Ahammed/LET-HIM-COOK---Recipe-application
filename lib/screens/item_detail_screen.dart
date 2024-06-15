import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:let_him_cook/data/api_functions.dart';
import 'package:let_him_cook/databse/db_helper.dart';
import 'package:let_him_cook/databse/db_opertions.dart';
import 'package:let_him_cook/model/favorite_model.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/loading_indicator.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:http/http.dart' as http;
import 'package:let_him_cook/utils/valuenotifiers.dart';
import 'package:let_him_cook/widgets/item_details/back_button.dart';
import 'package:let_him_cook/widgets/item_details/category_container.dart';
import 'package:let_him_cook/widgets/item_details/fav_icon.dart';
import 'package:let_him_cook/widgets/item_details/functions/checking_favorite.dart';
import 'package:let_him_cook/widgets/item_details/image.dart';
import 'package:let_him_cook/widgets/item_details/instruction_body.dart';
import 'package:let_him_cook/widgets/item_details/instruction_heading.dart';
import 'package:let_him_cook/widgets/item_details/item_name.dart';
import 'package:let_him_cook/widgets/item_details/origin_container.dart';
import 'package:lottie/lottie.dart';

class ItemDetailScreen extends StatefulWidget {
  final String? id;
  const ItemDetailScreen({super.key, this.id});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  @override
  void initState() {
    if (widget.id != null) {
      checkFavorite(widget.id!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundGradient(),
      child: Scaffold(
        backgroundColor: transparentColor,
        body: SafeArea(
            child: FutureBuilder<Map<String, dynamic>>(
          future: widget.id != null
              ? ApiFunctions. fetchItemById(widget.id!)
              :ApiFunctions. fetchItemRandomly(),
          builder: (context, snapshot) {
            final item = snapshot.data;

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Expanded(
                child: Center(child: SpoonLoadingIndicator()),
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      color: whiteColor,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: commonScreenPadding(context),
                          child: Row(
                            children: [
                              ItemDetailsBackButton(),
                              ItemName(item: item),
                              FavIconOnItemDetailScreen(item: item!)
                            ],
                          ),
                        ),
                        SizedBox(
                          height: mediaqueryHeight(0.01, context),
                        ),
                        ItemImageOnItemDetailScreen(item: item),
                        SizedBox(
                          height: mediaqueryHeight(0.03, context),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryHeight(0.008, context),
                  ),
                  Padding(
                    padding: commonScreenPadding(context),
                    child: Column(
                      children: [
                        CategoryContainer(item: item),
                        SizedBox(
                          height: mediaqueryHeight(0.02, context),
                        ),
                        OriginContainer(item: item),
                        SizedBox(
                          height: mediaqueryHeight(0.02, context),
                        ),
                        InstructionHeading(),
                        SizedBox(
                          height: mediaqueryHeight(0.007, context),
                        ),
                        InstructionBody(item: item)
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        )),
      ),
    );
  }
}

