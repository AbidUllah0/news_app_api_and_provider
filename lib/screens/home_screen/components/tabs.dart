import 'package:flutter/material.dart';

import '../../../utils/text_styles.dart';
import '../../../widgets/custom_text.dart';

class TabsWidget extends StatelessWidget {
  String text;
  VoidCallback onTap;
  Color? color;
  double? fontSize;

  TabsWidget(
      {required this.text, required this.onTap, this.color, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
        child: CustomText(
          text: text,
          style: AppTextStyles.drawerText.copyWith(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
