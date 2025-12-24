import 'package:flutter/material.dart';
import 'package:univent/generic_components/app_bar.dart';

import 'club_management_form.dart';

class ClubManagementPage extends StatelessWidget {
  const ClubManagementPage({super.key});

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
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: Image(image: AssetImage('assets/png/devrim.png'), fit: BoxFit.cover),
            ),
            const ClubManagementForm(),
          ],
        ),
      ),
    );
  }
}
