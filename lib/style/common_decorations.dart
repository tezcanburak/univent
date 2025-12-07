import 'package:flutter/material.dart';
import 'package:univent/constants/color.dart';

class CommonDecorations {
  static Decoration drawerRedDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.4, 1],
        colors: [ColorConstants.grey, ColorConstants.grey],
      ),
    );
  }

  static Decoration appBarGreyDecoration() {
    return BoxDecoration(
      borderRadius: const BorderRadius.only(bottomRight: Radius.circular(8), bottomLeft: Radius.circular(8)),
      gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [ColorConstants.black, ColorConstants.grey]),
    );
  }

  static Decoration lightGreyBackgroundDecoration() {
    return BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(10)), color: ColorConstants.lightGrey.withValues(alpha: 0.8));
  }

  static Decoration border10White() {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      color: ColorConstants.white,
      boxShadow: [BoxShadow(color: ColorConstants.black.withValues(alpha: 0.25), offset: Offset(0, 2), blurRadius: 4)],
    );
  }

  static Decoration gradientGreyDecoration() {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: [ColorConstants.lightGrey, ColorConstants.grey, ColorConstants.grey, ColorConstants.lightGrey],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        stops: const [0, 0.05, 0.95, 1],
      ),
      borderRadius: BorderRadius.circular(10),
    );
  }
}
