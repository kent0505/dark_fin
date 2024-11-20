import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'fonts.dart';

final theme = ThemeData(
  useMaterial3: false,
  fontFamily: Fonts.w400,
  scaffoldBackgroundColor: Colors.black,
  brightness: Brightness.dark,

  // textSelectionTheme: const TextSelectionThemeData(
  //   cursorColor: AppColors.main,
  //   selectionColor: AppColors.main,
  //   selectionHandleColor: AppColors.main,
  // ),
  // colorScheme: ColorScheme.fromSwatch(
  //   accentColor: AppColors.main, // overscroll indicator color
  // ),
  dialogTheme: const DialogTheme(
    // insetPadding: EdgeInsets.symmetric(horizontal: 20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
    ),
  ),
);

const cupertinoTheme = CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
      fontFamily: Fonts.w400,
      color: Colors.black,
    ),
    dateTimePickerTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontFamily: Fonts.w400,
    ),
  ),
);
