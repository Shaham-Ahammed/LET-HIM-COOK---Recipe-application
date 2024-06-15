import 'package:flutter/material.dart';
import 'package:let_him_cook/databse/db_helper.dart';
import 'package:let_him_cook/screens/item_detail_screen.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/utils/screen_transition.dart';

class FavListScreen extends StatefulWidget {
  const FavListScreen({super.key});

  @override
  State<FavListScreen> createState() => _FavListScreenState();
}

class _FavListScreenState extends State<FavListScreen> {
  List<Map<String, dynamic>> favList = [];

  bool isLoading = true;

  getAllFavList() async {
    final allData = await DbHelper.getAllData();
    setState(() {
      favList = allData;
      isLoading = false;
    });
  }

  @override
  void initState() {
    getAllFavList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundGradient(),
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: commonScreenPadding(context),
          child: isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
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
                            child: myFont("Favorites",
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
                              final item = favList[index];
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(FadeTransitionPageRoute(
                                          child: ItemDetailScreen(
                                    id: item['id'],
                                  )));
                                },
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
                                                    item['imageUrl'])),
                                            color: amberColor,
                                            borderRadius:
                                                BorderRadius.circular(90)),
                                      ),
                                      SizedBox(
                                        width: mediaqueryWidth(0.02, context),
                                      ),
                                      Container(
                                          width: mediaqueryWidth(0.64, context),
                                          child: myFont(item['name'],
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
                            itemCount: favList.length))
                  ],
                ),
        )),
      ),
    );
  }
}
