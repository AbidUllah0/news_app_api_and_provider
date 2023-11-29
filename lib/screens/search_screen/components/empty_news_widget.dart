import 'package:flutter/material.dart';
import 'package:nows_app_udemy/utils/text_styles.dart';
import 'package:nows_app_udemy/widgets/custom_text.dart';

import '../../../utils/app_bar_color_getter.dart';

class EmptyNewsWidget extends StatelessWidget {
  final String text;
  final String img;

  EmptyNewsWidget({required this.text, required this.img});

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context).getColor;
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(img),
          CustomText(
            text: text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 30,
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
