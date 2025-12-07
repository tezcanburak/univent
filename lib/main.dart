import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:univent/pages/home/bloc/home_bloc.dart';
import 'package:univent/pages/home/repo/home_repository.dart';
import 'package:univent/router/app_router.dart';
import 'package:univent/style/common_system_ui.dart';

import 'constants/color.dart';
import 'constants/util.dart';

void main() {
  final homeRepository = HomeRepository();
  // final authenticationRepository = AuthenticationRepository();
  runApp(
    Univent(
      homeRepository: homeRepository,
      //authenticationRepository: authenticationRepository
    ),
  );
}

class Univent extends StatelessWidget {
  const Univent({
    super.key,
    // required AuthenticationRepository authenticationRepository,
    required HomeRepository homeRepository,
  }) : _homeRepository = homeRepository;

  //_authenticationRepository = authenticationRepository,
  final HomeRepository _homeRepository;

  // final AuthenticationRepository _authenticationRepository;
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        //RepositoryProvider.value(value: _authenticationRepository),
        RepositoryProvider.value(value: _homeRepository),
      ],
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (_) => HomeBloc(homeRepository: _homeRepository))],
        child: MaterialApp.router(
          title: 'app.title',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light().copyWith(
            colorScheme: ColorScheme.fromSeed(seedColor: ColorConstants.grey),
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
        ),
      ),
    );
  }
}
