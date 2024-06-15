import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:let_him_cook/databse/db_helper.dart';
import 'package:let_him_cook/databse/db_opertions.dart';
import 'package:let_him_cook/model/favorite_model.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:http/http.dart' as http;

class ItemDetailScreen extends StatelessWidget {
  final String? id;
  const ItemDetailScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundGradient(),
      child: Scaffold(
        backgroundColor: transparentColor,
        body: SafeArea(
            child: FutureBuilder<Map<String, dynamic>>(
          future: id != null ? fetchItemById(id!) : fetchItemRandomly(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Expanded(
                child: Center(
                  child: CircularProgressIndicator(
                    color: whiteColor,
                  ),
                ),
              );
            }
            final item = snapshot.data;
            return SingleChildScrollView(
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
                                      horizontal:
                                          mediaqueryWidth(0.03, context)),
                                  width: mediaqueryWidth(
                                    0.7,
                                    context,
                                  ),
                                  child: Center(
                                    child: myFont(item!['strMeal'],
                                        fontFamily: patrickHand,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize:
                                            mediaqueryHeight(0.04, context),
                                        fontWeight: FontWeight.w700,
                                        fontColor: blackColor),
                                  )),
                              GestureDetector(
                                onTap: () {
                                  DbOperations().addToFav(item['idMeal'],
                                      item['strMeal'], item['strMealThumb']);
                                },
                                child: Icon(
                                  Icons.favorite_rounded,
                                  color: amberColor,
                                  size: mediaqueryHeight(0.04, context),
                                ),
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
                          backgroundImage: NetworkImage(item['strMealThumb']),
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
                                      fontSize:
                                          mediaqueryHeight(0.023, context),
                                      fontWeight: FontWeight.w500,
                                      fontColor: blackColor),
                                ),
                              ),
                              Container(
                                width: mediaqueryWidth(0.5, context),
                                child: Center(
                                    child: myFont(item['strCategory'],
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: josefin,
                                        fontSize:
                                            mediaqueryHeight(0.025, context),
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
                                      fontSize:
                                          mediaqueryHeight(0.023, context),
                                      fontWeight: FontWeight.w500,
                                      fontColor: blackColor),
                                ),
                              ),
                              Container(
                                width: mediaqueryWidth(0.5, context),
                                child: Center(
                                    child: myFont(item['strArea'],
                                        overflow: TextOverflow.ellipsis,
                                        fontFamily: josefin,
                                        fontSize:
                                            mediaqueryHeight(0.025, context),
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
                          padding:
                              EdgeInsets.all(mediaqueryHeight(0.02, context)),
                          child: myFont(item['strInstructions'],
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
            );
          },
        )),
      ),
    );
  }
}

Future<Map<String, dynamic>> fetchItemById(String id) async {
  final url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id";
  final uri = Uri.parse(url);
  try {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final item = json['meals'][0];
      return item;
    }
  } catch (e) {
    print("error occured $e");
  }
  return {};
}

Future<Map<String, dynamic>> fetchItemRandomly() async {
  final url = "https://www.themealdb.com/api/json/v1/1/random.php";
  final uri = Uri.parse(url);
  try {
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      final item = json['meals'][0];
      return item;
    }
  } catch (e) {
    print("error occured $e");
  }
  return {};
}
