import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_fonts.dart';

final theme = ThemeData.dark(
  useMaterial3: false,
).copyWith(
  // fontFamily: Fonts.w400,
  scaffoldBackgroundColor: Colors.black,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Colors.grey,
    selectionColor: Colors.grey,
    selectionHandleColor: Colors.grey,
  ),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: Colors.grey,
  ),
  dialogTheme: const DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
);

const cupertinoTheme = CupertinoThemeData(
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
      fontFamily: MyFonts.w400,
      color: Colors.black,
    ),
    dateTimePickerTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontFamily: MyFonts.w400,
    ),
  ),
);
