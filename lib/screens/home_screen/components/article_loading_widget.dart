import 'package:flutter/material.dart';
import 'package:nows_app_udemy/utils/app_bar_color_getter.dart';
import 'package:nows_app_udemy/widgets/vertical_spacing.dart';
import 'package:shimmer/shimmer.dart';

class ArticleLoading extends StatefulWidget {
  const ArticleLoading({super.key});

  @override
  State<ArticleLoading> createState() => _ArticleLoadingState();
}

class _ArticleLoadingState extends State<ArticleLoading> {
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

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ArticleLoadingWidget(
            highlightColor: highlightColor,
            baseColor: baseColor,
            height: height,
            widgetColor: widgetColor,
            width: width));
  }
}

class ArticleLoadingWidget extends StatelessWidget {
  const ArticleLoadingWidget({
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
    return ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Material(
            color: Theme.of(context).cardColor,
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
                  child: Shimmer.fromColors(
                    highlightColor: highlightColor,
                    baseColor: baseColor,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: height * 0.12,
                            color: widgetColor,
                            width: width * 0.22,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.05,
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
                                  height: height * 0.03,
                                  width: width * 0.3,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
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
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
