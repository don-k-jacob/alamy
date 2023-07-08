import 'package:flutter/material.dart';


ThemeData lightTheam = ThemeData(
    brightness: Brightness.light,
    primaryColor: kPrimaryColor,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: kPrimaryColor,
        ),
    // scaffoldBackgroundColor: kPrimaryColor.withOpacity(0.26),
    scaffoldBackgroundColor: Colors.white,
    cardColor: const Color(0xffF8E8ED),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: ThemeData.light().primaryColor,
        selectedIconTheme: const IconThemeData(
          color: Color(0xff181701),
        )),
    dialogTheme: DialogTheme(
      backgroundColor: const Color(0xffFDFCF1),
      contentTextStyle: ThemeData.light().textTheme.displaySmall,
      titleTextStyle: ThemeData.light().textTheme.titleLarge,
    ),
    focusColor: kPrimaryColor,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: kPrimaryColor,
      selectionColor: kPrimaryColor,
      selectionHandleColor: kPrimaryColor,
    ),
    
    buttonTheme: const ButtonThemeData(
        buttonColor: kPrimaryColor,

        textTheme: ButtonTextTheme.primary),
    // textTheme: TextTheme(
    //     titleLarge: kAppTitle,
    //     titleMedium: titleMedium,
    //     titleSmall: titleSmall,
    //     displayMedium: displaySmall,
    //     displaySmall: headline5,
    //     // headlineSmall: headlineSmall,
    //     bodySmall: bodySmall,
    //     bodyLarge: bodyLarge,
    //     displayLarge: displayLarge)
        );

// const kPrimaryColor = Color(0xffF37154);
const kPrimaryColor = Color(0xffB02550);


LinearGradient linearGradient = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            // const Color(0xffFFEDE9),
            // const Color(0xffFFF8F6).withOpacity(0.5),
            const Color(0xffFEF2F6),
            const Color(0xffFEF2F6).withOpacity(0.0),
          ],
        );