import 'package:flutter/material.dart';
import 'package:univent/generic_components/app_bar.dart';

import 'data_insight_form.dart';

class DataInsightPage extends StatelessWidget {
  const DataInsightPage({super.key});

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
            const DataInsightForm(),
          ],
        ),
      ),
    );
  }
}
