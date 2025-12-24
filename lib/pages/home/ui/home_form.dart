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
      ['assets/png/image_22.png', 'Management and Engineering Days', 'METU MM-25', 'November 21/22 Fri / Sat', 'FREE'],
      ['assets/png/image_23.png', 'Presentation called "Piano"', 'IIBF-A FAUD Amfi', 'November 15 Sat', 'FREE'],
      ['assets/png/image_24.png', 'W’EQUAL – Toplumsal Cinsiyet Eşitliği', 'KKM A Salon', 'December 1/2 Mon / Tue', 'FREE'],
      ['assets/png/image_25.png', 'Alternative Music Days', 'ODTÜ Mimarlık Amfisi', 'November 27/28 Thu / Fri – 17.30', '200 TL'],
      ['assets/png/image_26.png', '“Yaprak Dökümü” Book Critics', 'METU M-06 (Math Dep.)', 'November 23 Sun – 15.00', 'FREE'],
      ['assets/png/image_27.png', 'Cinema Interviews', 'ODTÜ KKM / Mimarlık Amfi', 'Nov / Dec / Jan', 'FREE'],
      ['assets/png/image_28.png', '“Bu Nasıl Sarışın” Musical', 'METU U3 Amfi (Physics)', 'October 23 Thu', '150 TL'],
    ];
    var width = MediaQuery.sizeOf(context).width;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: kToolbarHeight * 2),
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
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GridView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.6,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
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
          backgroundColor: _selectedFilter == index ? Colors.white.withValues(alpha: 0.95) : Colors.white.withValues(alpha: 0.6),
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
    borderRadius: BorderRadius.circular(10),
    child: SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Center(
              child: Image(image: AssetImage(image), fit: BoxFit.cover, width: width, height: width),
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
                      style: TextStyle(fontWeight: FontWeight.bold, color: ColorConstants.white),
                    ),
                  ),
                  SizedBox(
                    width: width - 10,
                    child: Text(
                      location,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: ColorConstants.white, fontSize: 12),
                    ),
                  ),
                  SizedBox(
                    width: width - 10,
                    child: Text(
                      date,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: ColorConstants.white, fontSize: 12),
                    ),
                  ),
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
