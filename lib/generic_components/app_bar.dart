import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:univent/style/common_decorations.dart';

import 'app_bar_back_arrow.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    this.widgetList,
    this.showBack = true,
    this.isCenter = false,
    this.title, // Added title parameter
    required this.pageContext,
    super.key,
  });

  final List<Widget>? widgetList;
  final bool showBack;
  final bool isCenter;
  final BuildContext pageContext;
  final Widget? title; // Title is now a customizable widget

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: isCenter,
      title: isCenter ? Center(child: title ?? defaultTitle()) : Center(child: title ?? defaultTitle()),
      flexibleSpace: Container(decoration: CommonDecorations.appBarGreyDecoration()),
      actions: [...?widgetList, showBack ? const AppBarBackArrow() : Container()],
    );
  }

  // Method for the default title widget
  Widget defaultTitle() {
    return InkWell(
      onTap: () {
        Navigator.popUntil(pageContext, (route) => route.isFirst);
      },
      child: SvgPicture.asset('assets/svg/univent.svg'),
    );
  }
}
