import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nows_app_udemy/utils/app_bar_color_getter.dart';
import 'package:nows_app_udemy/utils/app_images.dart';
import 'package:nows_app_udemy/utils/text_styles.dart';
import 'package:nows_app_udemy/widgets/custom_text.dart';
import 'package:page_transition/page_transition.dart';

import '../../../news_details_webview_screen/news_detail_webview_screen.dart';

class TopTrending extends StatelessWidget {
  const TopTrending({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Material(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  boxFit: BoxFit.cover,
                  errorWidget: Image.asset(AppImages.empty),
                  imageUrl:
                      'https://techcrunch.com/wp-content/uploads/2022/01/locket-app.jpg?w=1390&crop=1',
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: CustomText(
                  text: 'title',
                  style: AppTextStyles.header.copyWith(fontSize: 24),
                ),
              ),
              Row(
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
                      color: color,
                    ),
                  ),
                  Spacer(),
                  SelectableText(
                    '20-20-2022',
                    style: GoogleFonts.montserrat(fontSize: 15),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
