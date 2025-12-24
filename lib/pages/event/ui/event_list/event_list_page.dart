import 'package:flutter/material.dart';
import 'package:univent/constants/color.dart';
import 'package:univent/generic_components/app_bar.dart';
import 'package:univent/generic_components/drawer.dart';

import 'event_list_form.dart';

class EventListPage extends StatelessWidget {
  const EventListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,

      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(pageContext: context, showBack: true),
        body: Stack(
          children: [
            Container(width: MediaQuery.sizeOf(context).width, height: MediaQuery.sizeOf(context).height, color: Colors.black.withValues(alpha: 0.6)),
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
            const EventListForm(),
          ],
        ),
        endDrawer: UniventDrawer(),
      ),
    );
  }
}
