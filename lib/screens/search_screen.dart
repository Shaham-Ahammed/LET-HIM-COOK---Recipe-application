import 'package:flutter/material.dart';
import 'package:let_him_cook/data/api_functions.dart';
import 'package:let_him_cook/data/network_stream.dart';
import 'package:let_him_cook/utils/colors.dart';
import 'package:let_him_cook/utils/loading_indicator.dart';
import 'package:let_him_cook/utils/no_network.dart';
import 'package:let_him_cook/widgets/search_screen/debouncer.dart';
import 'package:let_him_cook/utils/mediaquery.dart';
import 'package:let_him_cook/widgets/item_lists/shimmer_on_listview.dart';
import 'package:let_him_cook/widgets/search_screen/empty_list.dart';
import 'package:let_him_cook/widgets/search_screen/listview.dart';
import 'package:let_him_cook/widgets/search_screen/search_box.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final Debouncer debouncer = Debouncer(milliseconds: 500);
  final FocusNode focusNode = FocusNode();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  @override
  void dispose() {
  
    focusNode.dispose();
    super.dispose();
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
          child: StreamBuilder<bool>(
            stream: networkConncetivityStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Expanded(
                        child: Center(
                      child: SpoonLoadingIndicator(),
                    ));
                  }
                  if (!snapshot.data!) {
                    return const NoNetworkDisplayWidget();
                  }
              return Column(
                children: [
                  searchWidgetOnSearchScreen(
                      context,focusNode,
                      (value) => debouncer.run(() {
                            setState(() {
                              searchQuery = value;
                            });
                          })),
                  SizedBox(
                    height: mediaqueryHeight(0.03, context),
                  ),
                  Expanded(
                    child: FutureBuilder<List<dynamic>>(
                      future: ApiFunctions.fetchingAccordingToName(searchQuery),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const ShimmerOnItemList();
                        }
                        if (snapshot.hasData && snapshot.data!.isEmpty) {
                          return const EmptySerchResultImageAndText();
                        }
              
                        return ListviewOnSearchScreen(
                          snapshot: snapshot,
                        );
                      },
                    ),
                  )
                ],
              );
            }
          ),
        )),
      ),
    );
  }

}
