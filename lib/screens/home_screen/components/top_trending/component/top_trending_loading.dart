import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:nows_app_udemy/screens/home_screen/components/top_trending/top_trending.dart';
import 'package:nows_app_udemy/utils/app_bar_color_getter.dart';
import 'package:nows_app_udemy/utils/vars_enum.dart';
import 'package:nows_app_udemy/widgets/vertical_spacing.dart';
import 'package:shimmer/shimmer.dart';

class TopTrendingLoading extends StatefulWidget {
  // final NewsType newsType;

  // TopTrendingLoading({required this.newsType});

  @override
  State<TopTrendingLoading> createState() => _TopTrendingLoadingState();
}

class _TopTrendingLoadingState extends State<TopTrendingLoading> {
  /// initialize shimmer colors , get from utils file
  late Color baseColor, highlightColor, widgetColor;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    baseColor = Utils(context).baseShimmerColor;
    highlightColor = Utils(context).highlightShimmerColor;
    widgetColor = Utils(context).widgetShimmerColor;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return
        // widget.newsType == NewsType.topTrending
        //   ?
        Swiper(
      itemWidth: MediaQuery.of(context).size.width * 0.8,
      layout: SwiperLayout.STACK,
      viewportFraction: 0.9,
      itemCount: 5,
      itemBuilder: (context, index) {
        return TopTrendingLoadingWidget(
            highlightColor: highlightColor,
            baseColor: baseColor,
            height: height,
            widgetColor: widgetColor,
            width: width);
      },
    );
    // : TopTrending();
  }
}

class TopTrendingLoadingWidget extends StatelessWidget {
  const TopTrendingLoadingWidget({
    super.key,
    required this.highlightColor,
    required this.baseColor,
    required this.height,
    required this.widgetColor,
    required this.width,
  });

  final Color highlightColor;
  final Color baseColor;
  final double height;
  final Color widgetColor;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Shimmer.fromColors(
          highlightColor: highlightColor,
          baseColor: baseColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: height * 0.33,
                  color: widgetColor,
                  width: width,
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: height * 0.06,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              VerticalSpacing(5),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: height * 0.02,
                  width: width * 0.4,
                  decoration: BoxDecoration(
                    color: widgetColor,
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
              ),
              VerticalSpacing(5),
              FittedBox(
                child: Row(
                  children: [
                    ClipOval(
                      child: Container(
                        height: 25,
                        width: 25,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      height: height * 0.03,
                      width: width * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(18),
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
