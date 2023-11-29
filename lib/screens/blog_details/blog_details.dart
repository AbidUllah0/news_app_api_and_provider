import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:nows_app_udemy/screens/blog_details/components/content_text.dart';
import 'package:nows_app_udemy/utils/text_styles.dart';
import 'package:nows_app_udemy/widgets/custom_text.dart';
import 'package:nows_app_udemy/widgets/vertical_spacing.dart';

import '../../utils/app_bar_color_getter.dart';
import '../../utils/app_images.dart';

class BlogDetails extends StatelessWidget {
  const BlogDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: CustomText(
          text: 'By Author',
          textAlign: TextAlign.center,
          style: TextStyle(color: color),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(IconlyLight.arrowLeft, color: color),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: 'title',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                VerticalSpacing(25),
                Row(
                  children: [
                    CustomText(
                        text: '20-20-2015',
                        style: AppTextStyles.smallTextStyle),
                    Spacer(),
                    CustomText(
                        text: 'reding time text',
                        style: AppTextStyles.smallTextStyle)
                  ],
                ),
                VerticalSpacing(25),
              ],
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: FancyShimmerImage(
                  boxFit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  errorWidget: Image.asset(AppImages.empty),
                  imageUrl:
                      'https://techcrunch.com/wp-content/uploads/2022/01/locket-app.jpg?w=1390&crop=1',
                ),
              ),
              Positioned(
                bottom: 0,
                right: 10,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 10,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            IconlyLight.bookmark,
                            size: 28,
                            color: color,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Card(
                        elevation: 10,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            IconlyLight.send,
                            size: 28,
                            color: color,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          VerticalSpacing(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ContentText(
                  text: 'Description',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                VerticalSpacing(10),
                ContentText(
                  text: 'Description' * 12,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                VerticalSpacing(20),
                ContentText(
                  text: 'Contents',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                VerticalSpacing(10),
                ContentText(
                  text: 'Description' * 12,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
                VerticalSpacing(20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
