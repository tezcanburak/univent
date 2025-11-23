import 'package:flutter/material.dart';
import 'package:univent/constants/color.dart';
import 'package:univent/style/common_decorations.dart';

class DataInsightForm extends StatelessWidget {
  const DataInsightForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      margin: const EdgeInsets.only(top: 130, left: 20, right: 20, bottom: 20),
      decoration: CommonDecorations.lightGreyBackgroundDecoration(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Event Data & Insights',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: ColorConstants.black,
              ),
            ),
            const SizedBox(height: 30),
        
            // Dropdown Container
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              decoration: CommonDecorations.border10White(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('Event 1', style: TextStyle(fontSize: 18)),
                  SizedBox(height: 6),
                  Text('Event 2', style: TextStyle(fontSize: 18)),
                ],
              ),
            ),

            const SizedBox(height: 35),

            Text(
              '"Event Name"',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: ColorConstants.black,
              ),
            ),

            const SizedBox(height: 24),

            _InsightBox(label: 'Views:'),
            const SizedBox(height: 16),
            _InsightBox(label: 'Interested:'),
            const SizedBox(height: 16),
            _InsightBox(label: 'May Participate:'),

            const SizedBox(height: 40),

            Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: CommonDecorations.border10White(),
              child: const Text(
                'Comments',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 24),

            Container(
              padding: const EdgeInsets.all(18),
              decoration: CommonDecorations.border10White(),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text('-Ahmet Berkay ERDOĞAN:  Güzel etkinlik olmuş elinize sağlık.'),
                  SizedBox(height: 12),
                  Text('-Egemen Kurt:  Kesinlikle tekrar katılacağım.'),
                  SizedBox(height: 12),
                  Text('-Burak TEZCAN:  Bilgisayar getirmek zorunlu mu?'),
                  SizedBox(height: 12),
                  Text('-Elif BEŞLİ:  Çok eğlenceliydi.'),
                  SizedBox(height: 12),
                  Text('-Kerim AŞIK:  Etkinlik sonrası after varsa geliyorum.'),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InsightBox extends StatelessWidget {
  final String label;
  const _InsightBox({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: CommonDecorations.border10White(),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          color: ColorConstants.black,
        ),
      ),
    );
  }
}
