import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:univent/constants/color.dart';
import 'package:univent/style/common_decorations.dart';

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
    description: 'Analyzing global and local economic systems through seminars, academic discussions, case studies, and guest lectures, while encouraging critical thinking about markets, policy, and sustainability.',
  ),
  ClubInfo(
    name: 'Gastronomy Community',
    logoPath: 'assets/png/clubs/gastronomy.png',
    description: 'Exploring culinary arts and food culture by organizing hands-on workshops, tasting events, and seminars that celebrate cuisines from around the world and promote creativity in gastronomy.',
  ),
  ClubInfo(
    name: 'Jazz Society',
    logoPath: 'assets/png/clubs/jazz.png',
    description: 'Promoting jazz music appreciation and performance through live concerts, jam sessions, listening parties, and discussions on the history and evolution of jazz.',
  ),
  ClubInfo(
    name: 'Puzzle Community',
    logoPath: 'assets/png/clubs/puzzle.png',
    description: 'Bringing students together to solve complex puzzles and riddles, improve analytical thinking skills, and organize events such as the annual METU Puzzle Day.',
  ),
  ClubInfo(
    name: 'Go Community',
    logoPath: 'assets/png/clubs/go.png',
    description: 'Focusing on the ancient strategy game of Go by offering beginner trainings, regular practice sessions, friendly matches, and competitive tournaments for all levels.',
  ),
  ClubInfo(
    name: 'Business Community',
    logoPath: 'assets/png/clubs/business.png',
    description: 'Developing professional and leadership skills through networking events, case competitions, workshops, and large-scale organizations such as the METU Business Summit.',
  ),
  ClubInfo(
    name: 'Architecture Community',
    logoPath: 'assets/png/clubs/architecture.png',
    description: 'A creative space for students interested in architecture, offering design discussions, technical workshops, exhibitions, and exploration of the built environment.',
  ),
  ClubInfo(
    name: 'Media Community',
    logoPath: 'assets/png/clubs/media.png',
    description: 'Engaging students in digital content creation, journalism, photography, video production, and modern communication trends through projects, trainings, and media events.',
  ),
  ClubInfo(
    name: 'Theatre Group',
    logoPath: 'assets/png/clubs/theatre.png',
    description: 'Providing a creative stage for acting, directing, and stagecraft, where students collaboratively produce theatrical plays and performances throughout the academic year.',
  ),
  ClubInfo(
    name: 'Language Community',
    logoPath: 'assets/png/clubs/language.png',
    description: 'Fostering multilingualism and cultural awareness through conversation clubs, language exchange programs, workshops, and international cultural activities.',
  ),
  ClubInfo(
    name: 'Fine Arts Society (GST)',
    logoPath: 'assets/png/clubs/fine_art.png',
    description: 'Providing a hub for visual and traditional arts, including painting, sculpture, and handicraft workshops, while encouraging artistic expression and creativity.',
  ),
  ClubInfo(
    name: 'Japanese Cultural Society',
    logoPath: 'assets/png/clubs/japanese.png',
    description: 'Celebrating Japanese culture through language study, anime and film screenings, cultural workshops, and traditional activities such as tea ceremonies and festivals.',
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
