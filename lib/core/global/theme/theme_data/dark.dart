import 'package:flutter/material.dart';

import '../../../utils/app_fonsts.dart';
import '../../../utils/app_sizes.dart';
import '../theme_color/theme_color_dark.dart';
import '../theme_color/theme_color_light.dart';

ThemeData get getThemeDataDark => ThemeData(
      primaryColor: ThemeColorDark.darkGreyClr,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ThemeColorDark.darkGreyClr,
      fontFamily: AppFonts.fontFamily,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: ThemeColorDark.darkGreyClr,
        iconTheme: IconThemeData(color: ThemeColorLight.white),
      ),

      /// TextFormField
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: ThemeColorLight.labelColor,
          fontSize: AppSizes.fs13,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColorDark.focusBorderTextField,
            width: AppSizes.bs0_5,
          ),
          borderRadius: BorderRadius.circular(AppSizes.br12),
        ),
        suffixIconColor: ThemeColorDark.labelMediumColor,
        fillColor: ThemeColorLight.fillColorTextFormField,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColorDark.focusBorderTextField,
            width: AppSizes.bs0_5,
          ),
          borderRadius: BorderRadius.circular(AppSizes.br12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColorDark.focusBorderTextField,
            width: AppSizes.bs0_5,
          ),
          borderRadius: BorderRadius.circular(AppSizes.br12),
        ),
        errorStyle: TextStyle(
          color: ThemeColorLight.validationTextFieldColor,
          fontSize: AppSizes.fs14,
          fontWeight: AppFonts.regular,
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ThemeColorDark.focusBorderTextField,
            width: AppSizes.bs0_5,
          ),
          borderRadius: BorderRadius.circular(AppSizes.br12),
        ),
        labelStyle: TextStyle(
          color: ThemeColorLight.black,
          fontSize: AppSizes.fs13,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(ThemeColorLight.primaryClr),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
                vertical: AppSizes.pH12, horizontal: AppSizes.pW22),
          ),
          foregroundColor:
              MaterialStateProperty.all<Color>(ThemeColorLight.primaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSizes.br12),
            ),
          ),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.br40),
        )),
        overlayColor: MaterialStateProperty.all<Color>(
          Colors.transparent,
        ),
      )),
      textTheme: getTextTheme(),
    );

getTextTheme() => TextTheme(
      /// Primary Color Light
      displaySmall: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),

      /// Primary Color AppBar
      displayMedium: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs24,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
      displayLarge: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs24,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),

      headlineLarge: TextStyle(
        color: ThemeColorLight.grayscale,
        fontSize: AppSizes.fs48,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      headlineMedium: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
      headlineSmall: TextStyle(
        color: ThemeColorLight.grayscale,
        fontSize: AppSizes.fs11,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),

      /// Body For Text in Black Color
      bodySmall: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),
      bodyMedium: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
      bodyLarge: TextStyle(
        color: ThemeColorLight.black,
        fontSize: AppSizes.fs32,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),

      /// Title
      titleSmall: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs13,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),

      /// White Text For Button
      titleMedium: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
      titleLarge: TextStyle(
        color: ThemeColorLight.white,
        fontSize: AppSizes.fs20,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),

      /// Label For Color Grey
      labelSmall: TextStyle(
        color: ThemeColorLight.labelColor,
        fontSize: AppSizes.fs11,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),

      labelMedium: TextStyle(
        color: ThemeColorLight.labelColor,
        fontSize: AppSizes.fs16,
        fontWeight: AppFonts.regular,
        fontFamily: AppFonts.fontFamily,
      ),

      labelLarge: TextStyle(
        color: ThemeColorLight.labelColor,
        fontSize: AppSizes.fs18,
        fontWeight: AppFonts.semiBlod,
        fontFamily: AppFonts.fontFamily,
      ),
    );
