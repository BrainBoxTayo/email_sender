import 'package:email_sender/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:email_sender/utils/theme/custom_themes/text_theme.dart';
import 'package:email_sender/utils/theme/custom_themes/elevated_button_theme.dart';
class CustomAppTheme {
  CustomAppTheme._();

  static ThemeData lightTheme = ThemeData(
    // Lighttheme ThemeData
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: CustomTextTheme.lightTextTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      labelStyle: TextStyle(color: Colors.black87),
      hintStyle: TextStyle(color: Colors.grey),
      floatingLabelStyle: TextStyle(color: CustomColors.primary),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    // darktheme ThemeData
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: CustomTextTheme.darkTextTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme
  );
}