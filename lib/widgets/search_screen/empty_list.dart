import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:let_him_cook/data/api_functions.dart';
import 'package:let_him_cook/screens/item_detail_screen.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/widgets/search_screen/debouncer.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/utils/screen_transition.dart';
import 'package:let_him_cook/widgets/item_lists/shimmer_on_listview.dart';
import 'package:let_him_cook/widgets/search_screen/empty_list.dart';
import 'package:let_him_cook/widgets/search_screen/listview.dart';
import 'package:let_him_cook/widgets/search_screen/search_box.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;

class EmptySerchResultImageAndText extends StatelessWidget {
  const EmptySerchResultImageAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          LottieBuilder.asset(
            "assets/animations/no_data_found.json",
            height: mediaqueryHeight(0.3, context),
          ),
          myFont(
              "No matches. Please check your\n spelling or try a different term.",
              fontFamily: josefin,
              fontSize: mediaqueryHeight(0.02, context),
              fontWeight: FontWeight.w500,
              fontColor: blackColor)
        ],
      ),
    );
  }
}

