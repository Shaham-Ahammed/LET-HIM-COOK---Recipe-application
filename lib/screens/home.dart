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
                  FutureBuilder(
                    future:fetchingCategories() ,
                    builder: (context, snapshot) {
                      
                      if (snapshot.connectionState==ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator(),);
                      }
                      return    Expanded(
                        child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: .7,
                          crossAxisSpacing: mediaqueryWidth(0.03, context),
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                    FadeTransitionPageRoute(
                                        child: CategoryListScreen()));
                              },
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://www.themealdb.com//images//media//meals//1548772327.jpg"),
                                backgroundColor: greyColor,
                                radius: mediaqueryHeight(0.06, context),
                              ),
                            ),
                            SizedBox(
                              height: mediaqueryHeight(0.01, context),
                            ),
                            myFont("fasads",
                                fontFamily: josefin,
                                fontSize: mediaqueryHeight(0.023, context),
                                fontWeight: FontWeight.w500,
                                fontColor: blackColor)
                          ],
                        );
                      },
                      itemCount: 9,
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


fetchingCategories()async{
   final url ="https://www.themealdb.com/api/json/v1/1/categories.php";
   final uri = Uri.parse(url);

   try {
  final response=   await  http.get(uri);
  if (response.statusCode==200) {
  
    final body = response.body;
     
    print(body);
  }
   } catch (e) {
     
   }
}