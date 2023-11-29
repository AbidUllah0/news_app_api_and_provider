import 'package:flutter/material.dart';

import '../../../utils/text_styles.dart';
import '../../../widgets/custom_text.dart';

class PaginationButtons extends StatelessWidget {
  String text;
  VoidCallback onPressed;

  PaginationButtons({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        padding: const EdgeInsets.all(6),
        textStyle: AppTextStyles.header,
      ),
      child: CustomText(
        text: text,
      ),
    );
  }
}
