import 'package:flutter/material.dart';
import 'package:z_news_feed/constants/app_constant.dart';


class AppTheme {
  AppTheme._();

  static const TextStyle smallTitle = TextStyle(
    fontFamily: FontNames.roboto,
    fontWeight: FontWeight.w500,
    fontSize: fontSize_15,
    fontStyle: FontStyle.normal,
    color: Colors.black,
  );

  static const TextStyle largeTitle = TextStyle(
    fontFamily: FontNames.roboto,
    fontWeight: FontWeight.w700,
    fontSize: fontSize_20,
    fontStyle: FontStyle.normal,
    color: Colors.black,
  );

  static const TextStyle screentitle = TextStyle(
    fontFamily: FontNames.roboto,
    fontWeight: FontWeight.w700,
    fontSize: fontSize_20,
    fontStyle: FontStyle.normal,
    color: Colors.white,
  );
}

class FontNames {
  // Font Names
  static const String roboto = 'Roboto';
}