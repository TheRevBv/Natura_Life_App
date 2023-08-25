import 'package:flutter/material.dart';
import 'package:natura_life/theme/apptheme.dart';

class WidgetTheme {
  static TextStyle loginTitle = TextStyle(
      fontFamily: 'OleoScript', fontSize: 45, color: AppTheme.primary);

  static TextStyle tabTitle = const TextStyle(fontSize: 20);
  static TextStyle appbarTitle =
      const TextStyle(fontFamily: 'OleoScript', fontSize: 27);

  static TextStyle bigTextTitle = const TextStyle(fontSize: 37);
  static TextStyle mediumTex = TextStyle(fontSize: 27, color: AppTheme.fifth);
  static TextStyle shortText = TextStyle(fontSize: 17, color: AppTheme.fourth);
}
