import 'package:e_commerce_app/core/resources/font_manager.dart';
import 'package:flutter/material.dart';

TextStyle? getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
      fontFamily: FontConstants.fontFamily);
}
