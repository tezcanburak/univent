import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SystemUi {
  static SystemUiOverlayStyle lightStyle() {
    return const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // transparent status bar
      statusBarBrightness: Brightness.dark,
      // this is for IOS
      statusBarIconBrightness: Brightness.light,
      // this is for Android
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    );
  }

  static SystemUiOverlayStyle darkStyle() {
    return const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // transparent status bar
      statusBarBrightness: Brightness.light,
      // this is for IOS
      statusBarIconBrightness: Brightness.dark,
      // this is for Android
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    );
  }
}
