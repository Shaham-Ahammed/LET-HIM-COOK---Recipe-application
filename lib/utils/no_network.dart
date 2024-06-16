import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';

class NoNetworkDisplayWidget extends StatelessWidget {
  const NoNetworkDisplayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Image.asset(
            "assets/images/no-wifi.png",
            height: mediaqueryHeight(0.15, context),
          ),
        ),
        SizedBox(
          height: mediaqueryHeight(0.02, context),
        ),
        myFont("SOMETHING WENT WRONG",
            fontFamily: patrickHand,
            fontSize: mediaqueryHeight(0.021, context),
            fontWeight: FontWeight.w600,
            fontColor: blackColor),
        SizedBox(
          height: mediaqueryHeight(0.01, context),
        ),
        myFont("please check your network connectivity.",
            fontFamily: josefin,
            fontSize: mediaqueryHeight(0.019, context),
            fontWeight: FontWeight.w600,
            fontColor: blackColor),
      ],
    );
  }
}
