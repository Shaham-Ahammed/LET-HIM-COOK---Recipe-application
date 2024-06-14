import 'dart:convert';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:let_him_cook/screens/item_detail_screen.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/utils/screen_transition.dart';
import 'package:http/http.dart' as http;

class CategoryListScreen extends StatelessWidget {
  final String category;
  const CategoryListScreen({super.key, required this.category});

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
                      child: myFont(category,
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
              FutureBuilder<List<dynamic>>(
                future: fetchingIndividualCategoryItems(category),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
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
                                      boxShadow: [
                                        BoxShadow(
                                            color: greyColor,
                                            offset: Offset(
                                                0,
                                                mediaqueryHeight(
                                                    0.005, context)),
                                            blurRadius: mediaqueryHeight(
                                                0.01, context)),
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
                                              color: greyColor,
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                        ),
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
                            itemCount: 8));
                  }
                  return Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            final item = snapshot.data![index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                    FadeTransitionPageRoute(
                                        child: ItemDetailScreen(id: item['idMeal'],)));
                              },
                              child: Container(
                                width: double.infinity,
                                height: mediaqueryHeight(0.076, context),
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color: greyColor,
                                          offset: Offset(0,
                                              mediaqueryHeight(0.005, context)),
                                          blurRadius:
                                              mediaqueryHeight(0.01, context)),
                                    ],
                                    color: amberColor,
                                    borderRadius: BorderRadius.circular(90)),
                                child: Row(
                                  children: [
                                    Container(
                                      height: double.infinity,
                                      width: mediaqueryWidth(0.17, context),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  item['strMealThumb'])),
                                          color: amberColor,
                                          borderRadius:
                                              BorderRadius.circular(90)),
                                    ),
                                    SizedBox(
                                      width: mediaqueryWidth(0.02, context),
                                    ),
                                    Container(
                                        width: mediaqueryWidth(0.64, context),
                                        child: myFont(item['strMeal'],
                                            overflow: TextOverflow.ellipsis,
                                            fontFamily: josefin,
                                            fontSize: mediaqueryHeight(
                                                0.023, context),
                                            fontWeight: FontWeight.w500,
                                            fontColor: blackColor))
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: mediaqueryHeight(0.023, context),
                            );
                          },
                          itemCount: snapshot.data!.length));
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}

Future<List<dynamic>> fetchingIndividualCategoryItems(String category) async {
  final url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=$category";
  final uri = Uri.parse(url);
  try {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final list = json['meals'];
      return list;
    }
  } catch (e) {
    print("exception caught $e");
    return [];
  }
  return [];
}
