import 'package:flutter/material.dart';
import 'package:univent/constants/color.dart';

class HomeForm extends StatelessWidget {
  const HomeForm({super.key});

  static const List<List<String>> data = [
    ['assets/png/image_16.png', 'Last Call for Sunglasses Party', 'Central Bar', 'November 08 Sat-21.00', '500 TL'],
    ['assets/png/image_17.png', 'W\'EQUAL\'22 Conversation', 'KKM-A Saloon', 'December 8-9 Mon/Tue', 'FREE'],
    ['assets/png/image_20.png', 'Presentation called "Piano"', 'Pablo Artisan Coffee', 'November 6 Thu-18.30', 'FREE'],
    ['assets/png/image_22.png', 'Management and Engineering Days', 'METU MM-25', 'November 21/22 Fri/Sat', 'FREE'],
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return _eventItem(data[index][0], data[index][1], data[index][2], data[index][3], data[index][4], (width - 36) / 2);
          },
        ),
      ),
    );
  }
}

Widget _eventItem(String image, String name, String location, String date, String cost, double width) {
  return Container(
    width: width,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Image(image: AssetImage(image))),
        Row(
          children: [
            SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(location, textAlign: TextAlign.start),
                Text(date, textAlign: TextAlign.start),
                Text(
                  cost,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: ColorConstants.red, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
