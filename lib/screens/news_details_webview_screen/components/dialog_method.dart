import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../widgets/custom_text.dart';

Future<void> errorDialog(
    {required String errorMessage, required BuildContext context}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Row(
          children: [
            Icon(
              IconlyBold.danger,
              color: Colors.red,
            ),
            SizedBox(width: 8),
            CustomText(text: 'An Error Accured'),
          ],
        ),
        content: CustomText(
          text: errorMessage,
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            child: Text('ok'),
          ),
        ],
      );
    },
  );
}
