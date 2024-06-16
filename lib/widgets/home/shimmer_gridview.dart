import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/mediaquery.dart';

class ShimmerOnHomeScreenForCategories extends StatelessWidget {
  const ShimmerOnHomeScreenForCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Shimmer.fromColors(
      baseColor: greyColor,
      highlightColor: greyColor2,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: .7,
            crossAxisSpacing: mediaqueryWidth(0.03, context),
            crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Column(
            children: [
              CircleAvatar(
                backgroundColor: greyColor,
                radius: mediaqueryHeight(0.06, context),
              ),
            ],
          );
        },
        itemCount: 9,
      ),
    ));
  }
}
