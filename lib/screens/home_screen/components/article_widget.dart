import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:nows_app_udemy/models/news_model.dart';
import 'package:nows_app_udemy/screens/blog_details/blog_details.dart';
import 'package:nows_app_udemy/screens/news_details_webview_screen/news_detail_webview_screen.dart';
import 'package:nows_app_udemy/services/news_api.dart';
import 'package:nows_app_udemy/utils/app_images.dart';
import 'package:nows_app_udemy/utils/text_styles.dart';
import 'package:nows_app_udemy/widgets/custom_text.dart';
import 'package:nows_app_udemy/widgets/vertical_spacing.dart';
import 'package:page_transition/page_transition.dart';

class ArticleWidget extends StatelessWidget {
  String title;

  ArticleWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    NewsApiServices newsApiServices = NewsApiServices();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BlogDetails()));
          },
          child: Stack(
            children: [
              Container(
                height: 60,
                width: 60,
                color: Theme.of(context).colorScheme.secondary,
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Container(
                  height: 60,
                  width: 60,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                color: Theme.of(context).cardColor,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: FancyShimmerImage(
                        height: height * 0.12,
                        width: width * 0.22,
                        boxFit: BoxFit.fill,
                        errorWidget: Image.asset(AppImages.empty),
                        imageUrl:
                            'https://techcrunch.com/wp-content/uploads/2022/01/locket-app.jpg?w=1390&crop=1',
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                              text: title,
                              textAlign: TextAlign.justify,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: AppTextStyles.smallTextStyle),
                          VerticalSpacing(5),
                          Align(
                            alignment: Alignment.topRight,
                            child: CustomText(
                                text: '⌚ Reading Time',
                                style: AppTextStyles.smallTextStyle),
                          ),
                          FittedBox(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      PageTransition(
                                        child: NewsDetailsWebView(),
                                        type: PageTransitionType.rightToLeft,
                                      ),
                                    );
                                  },
                                  icon: Icon(
                                    Icons.link,
                                    color: Colors.blue,
                                  ),
                                ),
                                CustomText(
                                    text: '20-4022' * 2,
                                    maxLines: 1,
                                    style: AppTextStyles.smallTextStyle),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
