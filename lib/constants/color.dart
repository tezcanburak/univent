import 'package:flutter/material.dart';

Color hexToColor(String hex) {
  assert(
  RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex),
  'hex color must be #rrggbb or #rrggbbaa',
  );

  return Color(
    int.parse(hex.substring(1), radix: 16) + (hex.length == 7 ? 0xff000000 : 0x00000000),
  );
}

class ColorConstants {
  static Color white = hexToColor('#F8F8F8');
  static Color red = hexToColor('#E31837');
  static Color grey = hexToColor('#717073');
  static Color lightGrey = hexToColor('#D9D9D9');
  static Color black = hexToColor('#000000');


  static LinearGradient gradientRedDecoration() {
    return LinearGradient(
      colors: [
        ColorConstants.red,
        ColorConstants.red,
      ],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      stops: const [0, 1],
    );
  }
}
