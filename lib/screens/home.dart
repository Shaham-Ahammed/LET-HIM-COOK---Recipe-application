import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [whiteColor, greyColor])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            child: Padding(
              padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: mediaqueryHeight(0.06, context),
                    decoration: BoxDecoration(
                        color: greyColor2,
                        borderRadius: BorderRadius.circular(90)),
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
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Search by food name",
                                hintStyle: TextStyle(
                                    color: whiteColor,
                                    fontFamily: josefin,
                                    fontSize:
                                        mediaqueryHeight(0.024, context))),
                          ),
                        ),
                        SizedBox(
                          width: mediaqueryWidth(0.067, context),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryHeight(0.027, context),
                  ),
                  Row(
                    children: [
                      Container(
                        width: mediaqueryWidth(0.55, context),
                        height: mediaqueryHeight(0.15, context),
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: greyColor,
                                  blurRadius: 2,
                                  offset: Offset(mediaqueryHeight(0.0, context),
                                      mediaqueryHeight(0.01, context)))
                            ],
                            color: amberColor,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            myFont("CONFUSED !",
                                fontFamily: patrickHand,
                                fontSize: mediaqueryHeight(0.03, context),
                                fontWeight: FontWeight.w600,
                                fontColor: blackColor),
                            myFont("suggest me with a\nsurprise recipe",
                                fontFamily: josefin,
                                fontSize: mediaqueryHeight(0.025, context),
                                fontWeight: FontWeight.w400,
                                fontColor: whiteColor)
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
