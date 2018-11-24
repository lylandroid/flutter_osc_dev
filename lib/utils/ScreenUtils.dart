import 'package:flutter/material.dart';

class ScreenUtils {
  static Size getScreenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double getScreenWidth(BuildContext context) {
    return getScreenSize(context).width;
  }

  static double getScreenHeight(BuildContext context) {
    return getScreenSize(context).height;
  }
}
