import 'dart:convert';
import 'package:let_him_cook/screens/item_detail_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:let_him_cook/screens/item_list.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/utils/screen_transition.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundGradient(),
      child: Scaffold(
        backgroundColor: transparentColor,
        body: SafeArea(
          child: Container(
            child: Padding(
              padding: commonScreenPadding(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            cursorColor: amberColor,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Shaham ahammed",
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
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(FadeTransitionPageRoute(
                              child: ItemDetailScreen()));
                        },
                        child: Container(
                          width: mediaqueryWidth(0.55, context),
                          height: mediaqueryHeight(0.15, context),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: greyColor,
                                    blurRadius: 2,
                                    offset: Offset(
                                        mediaqueryHeight(0.0, context),
                                        mediaqueryHeight(0.01, context)))
                              ],
                              color: amberColor,
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              myFont("CONFUSED !",
                                  fontFamily: patrickHand,
                                  fontSize: mediaqueryHeight(0.026, context),
                                  fontWeight: FontWeight.w600,
                                  fontColor: blackColor),
                              myFont("suggest me with a\nsurprise recipe",
                                  fontFamily: josefin,
                                  fontSize: mediaqueryHeight(0.022, context),
                                  fontWeight: FontWeight.w400,
                                  fontColor: whiteColor)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: mediaqueryWidth(0.07, context)),
                      Container(
                        width: mediaqueryWidth(0.25, context),
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
                            Icon(
                              Icons.favorite_rounded,
                              size: mediaqueryHeight(0.040, context),
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: mediaqueryHeight(0.01, context),
                            ),
                            myFont("Fav",
                                fontFamily: josefin,
                                fontSize: mediaqueryHeight(0.022, context),
                                fontWeight: FontWeight.w400,
                                fontColor: whiteColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mediaqueryHeight(0.03, context),
                  ),
                  myFont("CATEGORIES",
                      fontFamily: patrickHand,
                      fontSize: mediaqueryHeight(0.03, context),
                      fontWeight: FontWeight.w700,
                      fontColor: blackColor),
                  SizedBox(
                    height: mediaqueryHeight(0.03, context),
                  ),
                  FutureBuilder<List<dynamic>>(
                    future: fetchingCategories(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Expanded(
                            child: Shimmer.fromColors(
                          baseColor: greyColor,
                          highlightColor: greyColor2,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: .7,
                                    crossAxisSpacing:
                                        mediaqueryWidth(0.03, context),
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
                      return Expanded(
                          child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: .7,
                            crossAxisSpacing: mediaqueryWidth(0.03, context),
                            crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          final item = snapshot.data![index];
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(FadeTransitionPageRoute(
                                          child: CategoryListScreen(
                                    category: item['strCategory'],
                                  )));
                                },
                                child: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(item["strCategoryThumb"]),
                                  backgroundColor: greyColor2,
                                  radius: mediaqueryHeight(0.06, context),
                                ),
                              ),
                              SizedBox(
                                height: mediaqueryHeight(0.01, context),
                              ),
                              myFont(item['strCategory'],
                                  fontFamily: josefin,
                                  fontSize: mediaqueryHeight(0.02, context),
                                  fontWeight: FontWeight.w500,
                                  fontColor: blackColor)
                            ],
                          );
                        },
                        itemCount: snapshot.data!.length,
                      ));
                    },
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

Future<List<dynamic>> fetchingCategories() async {
  final url = "https://www.themealdb.com/api/json/v1/1/categories.php";
  final uri = Uri.parse(url);

  try {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final list = json['categories'];

      return list;
    }
  } catch (e) {
    print("error occured $e");
  }
  return [];
}
