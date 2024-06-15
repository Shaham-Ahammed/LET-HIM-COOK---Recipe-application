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

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();
  final Debouncer debouncer = Debouncer(milliseconds: 500);
  final FocusNode focusNode = FocusNode();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

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
              searchWidgetOnSearchScreen(
                context,
              ),
              SizedBox(
                height: mediaqueryHeight(0.03, context),
              ),
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: ApiFunctions.fetchingAccordingToName(searchQuery),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return ShimmerOnItemList();
                    }
                    if (snapshot.hasData && snapshot.data!.isEmpty) {
                      return EmptySerchResultImageAndText();
                    }

                    return ListviewOnSearchScreen(
                      snapshot: snapshot,
                    );
                  },
                ),
              )
            ],
          ),
        )),
      ),
    );
  }

  Container searchWidgetOnSearchScreen(BuildContext context) {
    return Container(
      width: double.infinity,
      height: mediaqueryHeight(0.06, context),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: blackColor, blurRadius: 4, offset: Offset(0, 4))
      ], color: greyColor2, borderRadius: BorderRadius.circular(90)),
      child: Row(
        children: [
          SizedBox(
            width: mediaqueryWidth(0.067, context),
          ),
          Icon(
            Icons.search,
            color: blackColor,
            size: mediaqueryHeight(0.034, context),
          ),
          SizedBox(
            width: mediaqueryWidth(0.05, context),
          ),
          Expanded(
            child: TextField(
              focusNode: focusNode,
              controller: controller,
              onChanged: (value) {
                debouncer.run(() {
                  setState(() {
                    searchQuery = value;
                  });
                });
              },
              cursorColor: amberColor,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search by food name",
                  hintStyle: TextStyle(
                      color: whiteColor,
                      fontFamily: josefin,
                      fontSize: mediaqueryHeight(0.024, context))),
            ),
          ),
          SizedBox(
            width: mediaqueryWidth(0.067, context),
          ),
        ],
      ),
    );
  }
}
