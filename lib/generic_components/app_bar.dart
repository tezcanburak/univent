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
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
      title: Center(child: title ?? defaultTitle()),
      flexibleSpace: Container(decoration: CommonDecorations.appBarGreyDecoration()),
      leading: showBack ? const AppBarBackArrow() : null,
      actions: [
        ...?widgetList,
        Builder(
          builder: (context) {
            final scaffold = Scaffold.maybeOf(context);
            final hasEndDrawer = scaffold?.hasEndDrawer ?? false;

            if (hasEndDrawer) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  scaffold!.openEndDrawer(); // 👈 opens UniventDrawer()
                },
              );
            }

            // Old spacer logic to keep title centered if needed
            if (showBack && (widgetList == null || widgetList!.isEmpty)) {
              return Opacity(
                opacity: 0,
                child: const SizedBox(width: kToolbarHeight),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
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
