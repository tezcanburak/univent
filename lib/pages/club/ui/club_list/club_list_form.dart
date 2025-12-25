import 'package:flutter/material.dart';
import 'package:univent/constants/color.dart';
import 'package:univent/style/common_decorations.dart';
import 'package:go_router/go_router.dart';
import 'package:univent/router/app_router.dart';

class ClubInfo {
  final String name;
  final String logoPath;
  final String description;

  const ClubInfo({required this.name, required this.logoPath, required this.description});
}

const List<ClubInfo> _clubs = [
  ClubInfo(
    name: 'Economy Community',
    logoPath: 'assets/png/clubs/econ.png',
    description: 'Analyzing global markets and economic trends through seminars and academic discussions.',
  ),
  ClubInfo(
    name: 'Gastronomy Community',
    logoPath: 'assets/png/clubs/gastronomy.png',
    description: 'Exploring culinary arts, hosting workshops, and celebrating food culture from around the world.',
  ),
  ClubInfo(
    name: 'Jazz Society',
    logoPath: 'assets/png/clubs/jazz.png',
    description: 'Promoting jazz music appreciation through live performances, jam sessions, and listening parties.',
  ),
  ClubInfo(
    name: 'Puzzle Community',
    logoPath: 'assets/png/clubs/puzzle.png',
    description: 'Bringing students together to solve complex puzzles, riddles, and organize the annual METU Puzzle Day.',
  ),
  ClubInfo(
    name: 'Go Community',
    logoPath: 'assets/png/clubs/go.png',
    description: 'Focusing on the ancient strategy game of Go, offering training for beginners and competitive tournaments.',
  ),
  ClubInfo(
    name: 'Business Community',
    logoPath: 'assets/png/clubs/business.png',
    description: 'Developing professional skills, networking with industry leaders, and organizing the METU Business Summit.',
  ),
  ClubInfo(
    name: 'Architecture Community',
    logoPath: 'assets/png/clubs/architecture.png',
    description: 'A creative space for design discussions, technical workshops, and exploring the built environment.',
  ),
  ClubInfo(
    name: 'Media Community',
    logoPath: 'assets/png/clubs/media.png',
    description: 'Engaging with digital content creation, journalism, photography, and modern communication trends.',
  ),
  ClubInfo(
    name: 'Theatre Group',
    logoPath: 'assets/png/clubs/theatre.png',
    description: 'METU’s creative stage for acting, directing, and stagecraft, producing multiple plays every academic year.',
  ),
  ClubInfo(
    name: 'Language Community',
    logoPath: 'assets/png/clubs/language.png',
    description: 'Fostering multilingualism through conversation clubs and cultural exchange programs.',
  ),
  ClubInfo(
    name: 'Fine Arts Society (GST)',
    logoPath: 'assets/png/clubs/fine_art.png',
    description: 'Providing a hub for visual arts, including painting, sculpture, and traditional handicraft workshops.',
  ),
  ClubInfo(
    name: 'Japanese Cultural Society',
    logoPath: 'assets/png/clubs/japanese.png',
    description: 'Celebrating Japanese culture through language study, anime screenings, and traditional tea ceremonies.',
  ),
];

class ClubListForm extends StatefulWidget {
  const ClubListForm({super.key});

  static final ScrollController _controller = ScrollController();

  @override
  State<ClubListForm> createState() => _ClubListFormState();
}

class _ClubListFormState extends State<ClubListForm> {
  final TextEditingController _searchController = TextEditingController();
  late List<ClubInfo> _filteredClubs;

  @override
  void initState() {
    super.initState();
    _filteredClubs = _clubs;
  }

  void _onSearchChanged(String query) {
    setState(() {
      _filteredClubs = _clubs.where((club) => club.name.toLowerCase().contains(query.toLowerCase())).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top + 12),
        Container(
          height: 48,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: ColorConstants.darkGrey,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white),
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

        // Only the list scrolls (no nested scroll controllers)
        Expanded(
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: CommonDecorations.lightGreyBackgroundDecoration(),
            child: ListView.separated(
              controller: ClubListForm._controller,
              itemCount: _filteredClubs.length,
              padding: EdgeInsets.all(4),
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final club = _filteredClubs[index];
                return InkWell(
                  onTap: () {
                    context.pushNamed('clubInfo', extra: club);
                  },
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        // Logo
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Colors.white),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(club.logoPath, fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 12),
                        // Club name
                        Expanded(
                          child: Text(
                            club.name,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
