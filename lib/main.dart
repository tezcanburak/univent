import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:univent/router/app_router.dart';
import 'package:univent/style/common_system_ui.dart';

import 'constants/color.dart';
import 'constants/util.dart';

void main() {
  runApp(const Univent());
}

class Univent extends StatelessWidget {
  const Univent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'app.title',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {TargetPlatform.android: CustomPageTransitionsBuilder(), TargetPlatform.iOS: CustomPageTransitionsBuilder()},
        ),
        snackBarTheme: SnackBarThemeData(
          elevation: 4,
          backgroundColor: ColorConstants.red,
          contentTextStyle: const TextStyle(color: Colors.white),
        ),

        textTheme: GoogleFonts.mulishTextTheme().apply(bodyColor: Colors.black),
        scaffoldBackgroundColor: ColorConstants.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.transparent, systemOverlayStyle: SystemUi.lightStyle()),
      ),
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
    );
  }
}
