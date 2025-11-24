import 'package:flutter/material.dart';
// import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:go_router/go_router.dart';
import 'package:univent/constants/color.dart';

class HomeForm extends StatefulWidget {
  const HomeForm({super.key});

  @override
  State<HomeForm> createState() => _HomeFormState();
}

class _HomeFormState extends State<HomeForm> {
  int _selectedFilter = 0; // 0: General, 1: Personal, 2: Upcoming, 3: Completed

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
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _filterButton('General', 0)),
                    const SizedBox(width: 16),
                    Expanded(child: _filterButton('Personal', 1)),
                  ],
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(child: _filterButton('Upcoming', 2)),
                    const SizedBox(width: 16),
                    Expanded(child: _filterButton('Completed', 3)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return _eventItem(
                  data[index][0],
                  data[index][1],
                  data[index][2],
                  data[index][3],
                  data[index][4],
                  ((width - 36) / 2),
                  onTap: () {
                    context.push(
                      '/eventInfo',
                      extra: {
                        'image': data[index][0],
                        'name': data[index][1],
                        'location': data[index][2],
                        'date': data[index][3],
                        'cost': data[index][4],
                      },
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _filterButton(String title, int index) {
    final bool isSelected = _selectedFilter == index;

    return SizedBox(
      height: 48,
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            _selectedFilter = index;
          });
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.white.withValues(alpha: 0.95),
          side: BorderSide(color: ColorConstants.red, width: 1.3),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: isSelected ? ColorConstants.red : Colors.black87),
        ),
      ),
    );
  }
}

Widget _eventItem(String image, String name, String location, String date, String cost, double width, {VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Center(
              child: Image(image: AssetImage(image), fit: BoxFit.cover),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width - 40,
                    child: Text(
                      name,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
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
    ),
  );
}
