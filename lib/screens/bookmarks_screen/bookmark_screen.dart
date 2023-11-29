import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nows_app_udemy/screens/search_screen/components/empty_news_widget.dart';
import 'package:nows_app_udemy/utils/app_bar_color_getter.dart';
import 'package:nows_app_udemy/utils/app_images.dart';

import '../../utils/text_styles.dart';
import '../../widgets/custom_text.dart';
import '../home_screen/components/article_widget.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: color),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: CustomText(
          text: 'Bookmarks',
          style: GoogleFonts.lobster(
            textStyle: AppTextStyles.drawerText.copyWith(
              letterSpacing: 0.6,
              color: color,
            ),
          ),
        ),
      ),
      body: EmptyNewsWidget(
        text: 'you didn\'t add anything yet to your bookmarks',
        img: AppImages.bookmark,
      ),
      // ListView.builder(
      //   itemCount: 5,
      //   shrinkWrap: true,
      //   itemBuilder: (context, index) {
      //     return ArticleWidget();
      //   },
      // ),
    );
  }
}
