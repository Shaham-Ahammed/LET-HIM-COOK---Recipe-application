import 'package:flutter/material.dart';
import 'package:let_him_cook/screens/item_detail_screen.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/utils/screen_transition.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back_ios_new)),
                  Center(
                      child: myFont("BEEF",
                          fontFamily: patrickHand,
                          fontSize: mediaqueryHeight(0.04, context),
                          fontWeight: FontWeight.w700,
                          fontColor: blackColor)),
                  Container()
                ],
              ),
              SizedBox(
                height: mediaqueryHeight(0.02, context),
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(FadeTransitionPageRoute(
                                child: ItemDetailScreen()));
                          },
                          child: Container(
                            width: double.infinity,
                            height: mediaqueryHeight(0.076, context),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: greyColor,
                                      offset: Offset(
                                          0, mediaqueryHeight(0.005, context)),
                                      blurRadius:
                                          mediaqueryHeight(0.01, context)),
                                ],
                                color: amberColor,
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: EdgeInsets.all(
                                  mediaqueryHeight(0.01, context)),
                              child: Row(
                                children: [
                                  Container(
                                    height: double.infinity,
                                    width: mediaqueryWidth(0.15, context),
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://www.themealdb.com//images//media//meals//1548772327.jpg")),
                                        color: greyColor,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                  ),
                                  SizedBox(
                                    width: mediaqueryWidth(0.02, context),
                                  ),
                                  Container(
                                      width: mediaqueryWidth(0.64, context),
                                      child: myFont(
                                          "fasdfsdsdfadfdsasffafsdffafadsadsafdsasdfssdafasdfafa",
                                          overflow: TextOverflow.ellipsis,
                                          fontFamily: josefin,
                                          fontSize:
                                              mediaqueryHeight(0.023, context),
                                          fontWeight: FontWeight.w500,
                                          fontColor: blackColor))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: mediaqueryHeight(0.023, context),
                        );
                      },
                      itemCount: 10))
            ],
          ),
        )),
      ),
    );
  }
}
