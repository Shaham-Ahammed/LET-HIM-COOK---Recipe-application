import 'package:let_him_cook/data/api_functions.dart';
import 'package:let_him_cook/data/network_stream.dart';
import 'package:let_him_cook/utils/loading_indicator.dart';
import 'package:let_him_cook/utils/no_network.dart';
import 'package:let_him_cook/widgets/home/cateogries_heading.dart';
import 'package:let_him_cook/widgets/home/fav_container.dart';
import 'package:let_him_cook/widgets/home/gridview_items.dart';
import 'package:let_him_cook/widgets/home/search_box.dart';
import 'package:let_him_cook/widgets/home/shimmer_gridview.dart';
import 'package:let_him_cook/widgets/home/surprise_recipe_container.dart';
import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/mediaquery.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundGradient(),
      child: Scaffold(
        backgroundColor: transparentColor,
        body: SafeArea(
          child: Padding(
            padding: commonScreenPadding(context),
            child: StreamBuilder<bool>(
                stream: networkConncetivityStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Expanded(
                        child: Center(
                      child: SpoonLoadingIndicator(),
                    ));
                  }
                  if (!snapshot.data!) {
                    return const NoNetworkDisplayWidget();
                  }
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SearchBoxInHome(),
                      SizedBox(
                        height: mediaqueryHeight(0.027, context),
                      ),
                      Row(
                        children: [
                          const SurpriseRecipeContainer(),
                          SizedBox(width: mediaqueryWidth(0.07, context)),
                          const FavContainer(),
                        ],
                      ),
                      SizedBox(
                        height: mediaqueryHeight(0.03, context),
                      ),
                      categoriesHeading(context),
                      SizedBox(
                        height: mediaqueryHeight(0.03, context),
                      ),
                      FutureBuilder<List<dynamic>>(
                        future: ApiFunctions.fetchingCategories(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const ShimmerOnHomeScreenForCategories();
                          }
                          return GridViewCategories(
                            snapshot: snapshot,
                          );
                        },
                      )
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
