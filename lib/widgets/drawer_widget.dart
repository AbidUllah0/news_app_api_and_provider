import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nows_app_udemy/providers/theme_provider.dart';
import 'package:nows_app_udemy/screens/bookmarks_screen/bookmark_screen.dart';
import 'package:nows_app_udemy/screens/home_screen/components/list_tile_drawer.dart';
import 'package:nows_app_udemy/screens/home_screen/home_screen.dart';
import 'package:nows_app_udemy/utils/app_images.dart';
import 'package:nows_app_udemy/utils/text_styles.dart';
import 'package:nows_app_udemy/widgets/custom_text.dart';
import 'package:nows_app_udemy/widgets/vertical_spacing.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: Material(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Image.asset(
                      AppImages.newsPaper,
                      // height: 60,
                      // width: 60,
                    ),
                  ),
                  VerticalSpacing(20),
                  Flexible(
                    child: CustomText(
                      text: 'News app',
                      style: GoogleFonts.lobster(
                        textStyle: AppTextStyles.drawerText
                            .copyWith(letterSpacing: 0.6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            VerticalSpacing(20),
            ListTileDrawer(
              label: 'Home',
              icon: IconlyBold.home,
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: HomeScreen(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
            ),
            ListTileDrawer(
              label: 'Bookmark',
              icon: IconlyBold.bookmark,
              onTap: () {
                Navigator.push(
                  context,
                  PageTransition(
                    child: BookMarkScreen(),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
            ),
            Divider(thickness: 5),
            SwitchListTile(
                title: CustomText(
                  text: themeProvider.getDarkTheme ? 'Dark' : 'Light',
                  style: AppTextStyles.drawerText,
                ),
                secondary: Icon(
                  themeProvider.getDarkTheme
                      ? Icons.dark_mode
                      : Icons.light_mode,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                value: themeProvider.getDarkTheme,
                onChanged: (bool value) {
                  setState(() {
                    themeProvider.setDarkTheme = value;
                  });
                }),
          ],
        ),
      ),
    );
  }
}
