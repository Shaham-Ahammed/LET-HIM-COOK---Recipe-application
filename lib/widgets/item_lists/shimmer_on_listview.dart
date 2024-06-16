import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/mediaquery.dart';


class ShimmerOnItemList extends StatelessWidget {
  const ShimmerOnItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Shimmer.fromColors(
                baseColor: greyColor,
                highlightColor: whiteColor,
                child: Container(
                  width: double.infinity,
                  height: mediaqueryHeight(0.076, context),
                  decoration: BoxDecoration(
                      color: amberColor,
                      borderRadius: BorderRadius.circular(90)),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                height: mediaqueryHeight(0.023, context),
              );
            },
            itemCount: 8));
  }
}
