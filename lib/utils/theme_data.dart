import 'package:flutter/material.dart';
import 'global_colors.dart';

///first create this data , then datk theme preferences in services

class Styles {
  ///static method to get the theming
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor:
          isDarkTheme ? darkScaffoldColor : lightScaffoldColor,
      primaryColor: isDarkTheme ? darkCardColor : lightCardColor,
      backgroundColor: isDarkTheme ? darkBackgroundColor : lightBackgroundColor,
      hintColor: isDarkTheme ? Colors.grey.shade400 : Colors.grey.shade700,
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: isDarkTheme ? Colors.white : Colors.black,
        selectionColor: Colors.blue,

        // selectionHandleColor: Colors.blue,
      ),

      ///context is used for only this
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: isDarkTheme ? Colors.white : Colors.black,
            displayColor: isDarkTheme ? Colors.white : Colors.black,
          ),
      cardColor: isDarkTheme ? darkCardColor : lightCardColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      colorScheme: ThemeData().colorScheme.copyWith(
            secondary: isDarkTheme ? darkIconsColor : lightIconsColor,
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
          ),
    );
  }
}
