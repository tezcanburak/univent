import 'package:flutter/material.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:univent/constants/color.dart';

class HomeForm extends StatefulWidget {
  HomeForm({super.key});

  final int selectedIndex = 0;
  final double? widthPercent = 0;

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onTabSelected(int index) {
    if (index != widget.selectedIndex) {
      _scrollToSelectedTab(index);
    }
  }

  void _scrollToSelectedTab(int index) {
    double tabWidth = MediaQuery.sizeOf(context).width / 2 - 30; // Replace with dynamic width if needed.
    double position = index * tabWidth - (MediaQuery.of(context).size.width - tabWidth) / 2;

    // Clamp the position to avoid overscrolling
    position = position.clamp(_scrollController.position.minScrollExtent, _scrollController.position.maxScrollExtent);

    _scrollController.animateTo(position, duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    const List<List<String>> data = [
      ['assets/png/image_16.png', 'Last Call for Sunglasses Party', 'Central Bar', 'November 08 Sat-21.00', '500 TL'],
      ['assets/png/image_17.png', 'W\'EQUAL\'22 Conversation', 'KKM-A Saloon', 'December 8-9 Mon/Tue', 'FREE'],
      ['assets/png/image_20.png', 'Presentation called "Piano"', 'Pablo Artisan Coffee', 'November 6 Thu-18.30', 'FREE'],
      ['assets/png/image_22.png', 'Management and Engineering Days', 'METU MM-25', 'November 21/22 Fri/Sat', 'FREE'],
    ];
    var width = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              child: Container(
                padding: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.25), offset: const Offset(0, 2), blurRadius: 2)],
                ),
                child: FlutterToggleTab(
                  borderRadius: 8,
                  selectedIndex: 0,
                  selectedBackgroundColors: [ColorConstants.red, ColorConstants.red],
                  unSelectedBackgroundColors: const [Colors.white],
                  selectedTextStyle: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                  unSelectedTextStyle: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w400),
                  dataTabs: [
                    DataTab(title: 'Completed'),
                    DataTab(title: 'Upcoming'),
                  ],
                  selectedLabelIndex: _onTabSelected,
                  width: 100 * (width - 20) / (width), // % This is percent width (widthInPercent)
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.8),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return _eventItem(data[index][0], data[index][1], data[index][2], data[index][3], data[index][4], ((width - 36) / 2));
              },
            ),
          ),
        ],
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
