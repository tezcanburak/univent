import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:univent/constants/color.dart';

class AppBarBackArrow extends StatelessWidget {
  const AppBarBackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2),
      child: InkWell(
        splashColor: ColorConstants.white,
        borderRadius: BorderRadius.circular(28),
        onTap: () => Navigator.pop(context),
        child: Container(
          width: 56,
          height: 56,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: SvgPicture.asset(
              'assets/svg/back_arrow_white.svg',
              height: 20,
              width: 12,
            ),
          ),
        ),
      ),
    );
  }
}
