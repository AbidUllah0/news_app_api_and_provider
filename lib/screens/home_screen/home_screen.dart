import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nows_app_udemy/models/news_model.dart';
import 'package:nows_app_udemy/screens/home_screen/components/article_widget.dart';
import 'package:nows_app_udemy/screens/home_screen/components/pagination_buttons.dart';
import 'package:nows_app_udemy/screens/home_screen/components/tabs.dart';
import 'package:nows_app_udemy/screens/home_screen/components/top_trending/component/top_trending_loading.dart';
import 'package:nows_app_udemy/screens/home_screen/components/top_trending/top_trending.dart';
import 'package:nows_app_udemy/screens/search_screen/search_screen.dart';
import 'package:nows_app_udemy/utils/app_bar_color_getter.dart';
import 'package:nows_app_udemy/widgets/drawer_widget.dart';
import 'package:nows_app_udemy/widgets/vertical_spacing.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../services/news_api.dart';
import '../../utils/text_styles.dart';
import '../../utils/vars_enum.dart';
import '../../widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var newsType = NewsType.allNews;
  int currentPageIndex = 0;

  ///initial selected is published at
  String sortBy = SortByEnum.publishedAt.name;

  List<DropdownMenuItem<String>> get dropDownItems {
    List<DropdownMenuItem<String>> menuItem = [
      DropdownMenuItem(
        value: SortByEnum.relevancy.name,
        child: Text(
          ///.name mean , that i want to get it in the form of string
          SortByEnum.relevancy.name,
        ),
      ),
      DropdownMenuItem(
        value: SortByEnum.publishedAt.name,
        child: Text(
          SortByEnum.publishedAt.name,
        ),
      ),
      DropdownMenuItem(
        value: SortByEnum.popularity.name,
        child: Text(
          SortByEnum.popularity.name,
        ),
      ),
    ];
    return menuItem;
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    NewsApiServices newsApiServices = NewsApiServices();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: color),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: CustomText(
            text: 'News app',
            style: GoogleFonts.lobster(
              textStyle: AppTextStyles.drawerText.copyWith(
                letterSpacing: 0.6,
                color: color,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: SearchScreen(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
              icon: Icon(IconlyLight.search),
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        drawer: const DrawerWidget(),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    TabsWidget(
                        text: 'All News',
                        onTap: () {
                          if (newsType == NewsType.allNews) {
                            return;
                          }
                          setState(() {
                            newsType = NewsType.allNews;
                          });
                        },
                        color: newsType == NewsType.allNews
                            ? Theme.of(context).cardColor
                            : Colors.transparent,
                        fontSize: newsType == NewsType.allNews ? 22 : 14),
                    TabsWidget(
                      text: 'Top Trending',
                      onTap: () {
                        if (newsType == NewsType.topTrending) {
                          return;
                        }
                        setState(
                          () {
                            newsType = NewsType.topTrending;
                          },
                        );
                        print('trending');
                        // TopTrending();
                      },
                      color: newsType == NewsType.topTrending
                          ? Theme.of(context).cardColor
                          : Colors.transparent,
                      fontSize: newsType == NewsType.topTrending ? 22 : 14,
                    ),
                  ],
                ),
                VerticalSpacing(10),

                /// when tap on  all news , button will appear , in top trending not appear
                newsType == NewsType.topTrending
                    ? Container()
                    : SizedBox(
                        height: kBottomNavigationBarHeight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ///pagination prev btn

                            PaginationButtons(
                              text: 'Prev',
                              onPressed: () {
                                if (currentPageIndex == 0) {
                                  /// when page is zero , then do nothing
                                  return;
                                }
                                setState(() {
                                  currentPageIndex -= 1;
                                });
                              },
                            ),

                            /// pagination numbers ( 1, 2, 3, 4, ,5)
                            Flexible(
                              flex: 2,
                              child: ListView.builder(
                                itemCount: 5,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          currentPageIndex = index;
                                        });
                                      },
                                      borderRadius: BorderRadius.circular(8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: currentPageIndex == index
                                              ? Colors.blue
                                              : Theme.of(context).cardColor,
                                        ),
                                        padding: EdgeInsets.all(8),
                                        child: Center(
                                          child:
                                              CustomText(text: '${index + 1}'),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            ///pagination next btn
                            PaginationButtons(
                              text: 'Next',
                              onPressed: () {
                                if (currentPageIndex == 4) {
                                  /// when page is zero , then do nothing
                                  return;
                                }
                                setState(() {
                                  currentPageIndex += 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                VerticalSpacing(10),

                /// drop down button
                newsType == NewsType.topTrending
                    ? Container()
                    : Align(
                        alignment: Alignment.topRight,
                        child: Material(
                          color: Theme.of(context).cardColor,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: DropdownButton(
                              value: sortBy,
                              items: dropDownItems,
                              onChanged: (String? value) {},
                              underline: Container(),
                            ),
                          ),
                        ),
                      ),

                /// articles data in list view
                if (newsType == NewsType.allNews)
                  FutureBuilder(
                      future: newsApiServices.getAllNews(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return CircularProgressIndicator();
                        } else {
                          return ListView.builder(
                            itemCount:
                                newsApiServices.newsList[0].articles!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              newsApiServices.getAllNews();
                              return ArticleWidget(
                                // title: 'abid',
                                title: newsApiServices
                                    .newsList[0].articles![index].title
                                    .toString(),
                              );
                            },
                          );
                        }
                      }),

                if (newsType == NewsType.topTrending)
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: Swiper(
                        itemWidth: MediaQuery.of(context).size.width * 0.8,
                        layout: SwiperLayout.STACK,
                        viewportFraction: 0.9,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return TopTrending();
                          // TopTrendingLoading(newsType: newsType);
                        },
                      )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
