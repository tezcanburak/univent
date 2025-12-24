import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:univent/constants/color.dart';
import 'package:univent/generic_components/drawer.dart';
import 'package:univent/style/common_decorations.dart';

import 'home_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: PopScope(
        canPop: false,
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            /// This color for Drawer's Hamburger Icon!!!
            iconTheme: IconThemeData(color: Colors.white),
            centerTitle: true,
            title: SvgPicture.asset('assets/svg/univent.svg'),
            flexibleSpace: Container(decoration: CommonDecorations.appBarGreyDecoration()),
          ),
          body: Stack(
            children: [
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                color: Colors.black.withValues(alpha: 0.6),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: Image(image: AssetImage('assets/png/devrim.png'), fit: BoxFit.cover),
              ),
              Container(
                color: ColorConstants.black.withValues(alpha: 0.3),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
              ),
              const HomeForm(),
            ],
          ),
          endDrawer: UniventDrawer(),
        ),
      ),
    );
  }
}
