import 'package:flutter/material.dart';
import 'package:univent/constants/color.dart';

class EventListForm extends StatefulWidget {
  const EventListForm({super.key});

  @override
  State<EventListForm> createState() => _EventListFormState();
}

class _EventListFormState extends State<EventListForm> {
  final TextEditingController _searchController = TextEditingController();

  // Demo data (replace with your real data source later)
  final List<_EventItem> _events = const [
    _EventItem(title: 'Sunglasses Party', community: 'METUBIZ', dateTimeText: '08.11.2026 / 21.00', imageAsset: 'assets/png/image_16.png'),
    _EventItem(
      title: "W’EQUAL’22 Conversation",
      community: 'Verimlilik Topluluğu',
      dateTimeText: '08.11.2026 / 21.00',
      imageAsset: 'assets/png/image_17.png',
    ),
    _EventItem(
      title: 'Presentation called “Piano”',
      community: 'Müzik Topluluğu',
      dateTimeText: '08.11.2026 / 21.00',
      imageAsset: 'assets/png/image_20.png',
    ),
    _EventItem(title: 'Sinema Söyleşileri', community: 'Sinema Topluluğu', dateTimeText: '08.11.2026 / 21.00', imageAsset: 'assets/png/image_27.png'),
    _EventItem(title: 'Kitap Kritiği', community: 'Okuma Topluluğu', dateTimeText: '08.11.2026 / 21.00', imageAsset: 'assets/png/image_26.png'),
    _EventItem(title: 'Spotlight', community: 'METUBIZ', dateTimeText: '08.11.2026 / 21.00', imageAsset: 'assets/png/image_23.png'),
    _EventItem(title: 'YMG+', community: 'Verimlilik Topluluğu', dateTimeText: '08.11.2026 / 21.00', imageAsset: 'assets/png/image_25.png'),
  ];

  late List<_EventItem> _filteredEvents;

  @override
  void initState() {
    super.initState();
    _filteredEvents = List<_EventItem>.from(_events);
  }

  void _onSearchChanged(String query) {
    final q = query.trim().toLowerCase();
    setState(() {
      if (q.isEmpty) {
        _filteredEvents = List<_EventItem>.from(_events);
      } else {
        _filteredEvents = _events.where((e) {
          return e.title.toLowerCase().contains(q) || e.community.toLowerCase().contains(q) || e.dateTimeText.toLowerCase().contains(q);
        }).toList();
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = Colors.grey.shade300;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Search Bar
        SizedBox(height: MediaQuery.of(context).padding.top + 12),
        Container(
          height: 48,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: ColorConstants.darkGrey,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: borderColor),
          ),
          alignment: Alignment.center,
          child: TextField(
            controller: _searchController,
            onChanged: _onSearchChanged,
            style: TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'Search',
              prefixIcon: Icon(Icons.search, color: Colors.white),
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),

        const SizedBox(height: 12),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: ListView.separated(
                padding: EdgeInsets.zero,
                itemCount: _filteredEvents.length,
                separatorBuilder: (_, __) => const SizedBox(height: 6),
                itemBuilder: (context, index) {
                  final e = _filteredEvents[index];
                  return _EventTile(item: e);
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
      ],
    );
  }
}

class _EventItem {
  final String title;
  final String community;
  final String dateTimeText;
  final String imageAsset;

  const _EventItem({required this.title, required this.community, required this.dateTimeText, required this.imageAsset});
}

class _EventTile extends StatelessWidget {
  final _EventItem item;

  const _EventTile({required this.item});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(color: ColorConstants.lightGrey, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black),
                ),
                const SizedBox(height: 6),
                Text(
                  item.community,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
                ),
                const SizedBox(height: 6),
                Text(
                  item.dateTimeText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.asset(item.imageAsset, width: width * 0.28, height: width * 0.28, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}
