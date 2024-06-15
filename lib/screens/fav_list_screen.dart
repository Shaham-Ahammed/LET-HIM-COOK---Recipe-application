import 'package:flutter/material.dart';
import 'package:let_him_cook/databse/db_helper.dart';
import 'package:let_him_cook/databse/db_opertions.dart';
import 'package:let_him_cook/screens/item_detail_screen.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/font.dart';
import 'package:let_him_cook/utils/loading_indicator.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/utils/screen_transition.dart';
import 'package:let_him_cook/widgets/fav_list_screen/box_decoartion.dart';
import 'package:let_him_cook/widgets/fav_list_screen/heading_and_backbutton.dart';
import 'package:let_him_cook/widgets/fav_list_screen/heart_icon.dart';
import 'package:let_him_cook/widgets/fav_list_screen/item_image.dart';
import 'package:let_him_cook/widgets/fav_list_screen/item_name.dart';
import 'package:let_him_cook/widgets/fav_list_screen/list_empty_img_and_text.dart';

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
        backgroundColor: transparentColor,
        body: SafeArea(
            child: Padding(
          padding: commonScreenPadding(context),
          child: isLoading
              ? Center(child: SpoonLoadingIndicator())
              : Column(
                  children: [
                    FavListHeadingAndBackButton(),
                    SizedBox(
                      height: mediaqueryHeight(0.02, context),
                    ),
                    Expanded(
                        child: favList.isEmpty
                            ? FavEmptyImageAndText()
                            : ListView.separated(
                                itemBuilder: (context, index) {
                                  final item = favList[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(FadeTransitionPageRoute(
                                              child: ItemDetailScreen(
                                        id: item['id'],
                                      )))
                                          .then(
                                        (value) {
                                          getAllFavList();
                                        },
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: mediaqueryHeight(0.076, context),
                                      decoration: favListBoxDecoration(context),
                                      child: Row(
                                        children: [
                                          FavListImage(item: item),
                                          SizedBox(
                                            width:
                                                mediaqueryWidth(0.02, context),
                                          ),
                                          FavListName(item: item),
                                          SizedBox(
                                            width:
                                                mediaqueryWidth(0.05, context),
                                          ),
                                          heartIcon(item, context, () {
                                            getAllFavList();
                                          })
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
