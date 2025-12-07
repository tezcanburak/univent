import 'package:flutter/material.dart';
import 'package:univent/generic_components/app_bar.dart';

import 'calendar_form.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,

      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(pageContext: context, showBack: true, isCenter: true),
        body: Stack(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: Image(image: AssetImage('assets/png/devrim.png'), fit: BoxFit.cover),
            ),
            Container(width: MediaQuery.sizeOf(context).width, height: MediaQuery.sizeOf(context).height, color: Colors.black.withValues(alpha: 0.6)),

            const CalendarForm(),
          ],
        ),
      ),
    );
  }
}
