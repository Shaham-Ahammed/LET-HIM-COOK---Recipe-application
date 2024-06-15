import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:lottie/lottie.dart';

class SpoonLoadingIndicator extends StatelessWidget {
  const SpoonLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      "assets/animations/loading_animation.json",
      height: mediaqueryHeight(0.2, context),
    );
  }
}
