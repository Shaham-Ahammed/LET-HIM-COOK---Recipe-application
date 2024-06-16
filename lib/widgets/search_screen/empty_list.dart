import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:lottie/lottie.dart';

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

