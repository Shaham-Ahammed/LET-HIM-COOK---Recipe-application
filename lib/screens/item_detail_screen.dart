import 'package:flutter/material.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';

class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundGradient(),
      child: Scaffold(
        backgroundColor: transparentColor,
        body: SafeArea(
            child: SingleChildScrollView(
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
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: greyColor2,
                              ),
                              padding: EdgeInsets.all(
                                  mediaqueryHeight(0.01, context)),
                              child: Icon(
                                Icons.keyboard_arrow_left_sharp,
                                size: mediaqueryHeight(0.036, context),
                                color: blackColor,
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: mediaqueryWidth(0.03, context)),
                              width: mediaqueryWidth(
                                0.7,
                                context,
                              ),
                              child: Center(
                                child: myFont("jkdhjkfajds",
                                    fontFamily: patrickHand,
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: mediaqueryHeight(0.04, context),
                                    fontWeight: FontWeight.w700,
                                    fontColor: blackColor),
                              )),
                          Icon(
                            Icons.favorite_rounded,
                            color: amberColor,
                            size: mediaqueryHeight(0.04, context),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: mediaqueryHeight(0.01, context),
                    ),
                    CircleAvatar(
                      radius: mediaqueryHeight(0.17, context),
                      backgroundColor: greyColor2,
                      backgroundImage: NetworkImage(
                          "https://www.themealdb.com//images//media//meals//1548772327.jpg"),
                    ),
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
                    Container(
                      width: mediaqueryWidth(1, context),
                      height: mediaqueryHeight(0.07, context),
                      decoration: BoxDecoration(
                          color: greyColor2,
                          borderRadius: BorderRadius.circular(90)),
                      child: Row(
                        children: [
                          Container(
                            width: mediaqueryWidth(0.4, context),
                            height: mediaqueryHeight(0.07, context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              color: amberColor,
                            ),
                            child: Center(
                              child: myFont("Category",
                                  fontFamily: josefin,
                                  fontSize: mediaqueryHeight(0.023, context),
                                  fontWeight: FontWeight.w500,
                                  fontColor: blackColor),
                            ),
                          ),
                          Container(
                            width: mediaqueryWidth(0.5, context),
                            child: Center(
                                child: myFont("beef",
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: josefin,
                                    fontSize: mediaqueryHeight(0.025, context),
                                    fontWeight: FontWeight.w500,
                                    fontColor: blackColor)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: mediaqueryHeight(0.02, context),
                    ),
                    Container(
                      width: mediaqueryWidth(1, context),
                      height: mediaqueryHeight(0.07, context),
                      decoration: BoxDecoration(
                          color: amberColor,
                          borderRadius: BorderRadius.circular(90)),
                      child: Row(
                        children: [
                          Container(
                            width: mediaqueryWidth(0.4, context),
                            height: mediaqueryHeight(0.07, context),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              color: greyColor2,
                            ),
                            child: Center(
                              child: myFont("Origin",
                                  fontFamily: josefin,
                                  fontSize: mediaqueryHeight(0.023, context),
                                  fontWeight: FontWeight.w500,
                                  fontColor: blackColor),
                            ),
                          ),
                          Container(
                            width: mediaqueryWidth(0.5, context),
                            child: Center(
                                child: myFont("Indian",
                                    overflow: TextOverflow.ellipsis,
                                    fontFamily: josefin,
                                    fontSize: mediaqueryHeight(0.025, context),
                                    fontWeight: FontWeight.w500,
                                    fontColor: blackColor)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: mediaqueryHeight(0.02, context),
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: myFont("Instructions",
                            fontFamily: josefin,
                            fontSize: mediaqueryHeight(0.028, context),
                            fontWeight: FontWeight.w600,
                            fontColor: blackColor)),
                    SizedBox(
                      height: mediaqueryHeight(0.007, context),
                    ),
                    Container(
                      width: mediaqueryWidth(1, context),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(mediaqueryHeight(0.02, context)),
                      child: myFont(
                          "ajshdkfahsjhjaskjadhksjhfajkhsdjkhfasdhfhjakkjdhfjhkakjsdhfjajhdfkjhaf",
                          fontFamily: josefin,
                          fontSize: mediaqueryHeight(0.02, context),
                          fontWeight: FontWeight.w400,
                          fontColor: blackColor),
                    )
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
