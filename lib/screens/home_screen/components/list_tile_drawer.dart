import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../utils/text_styles.dart';
import '../../../widgets/custom_text.dart';

class ListTileDrawer extends StatelessWidget {
  String label;
  IconData icon;
  void Function()? onTap;

  ListTileDrawer({required this.label, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: CustomText(
        text: label,
        style: AppTextStyles.drawerText,
      ),
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.secondary,
      ),
    );
  }
}
