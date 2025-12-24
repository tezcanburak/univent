import 'package:flutter/material.dart';
import 'package:univent/constants/color.dart';
import 'package:univent/style/common_decorations.dart';

class _ClubInfo {
  final String name;
  final String logoPath;

  const _ClubInfo({required this.name, required this.logoPath});
}

const List<_ClubInfo> _clubs = [
  _ClubInfo(name: 'Economy Community', logoPath: 'assets/png/clubs/econ.png'),
  _ClubInfo(name: 'Gastronomy Community', logoPath: 'assets/png/clubs/gastronomy.png'),
  _ClubInfo(name: 'Jazz Society', logoPath: 'assets/png/clubs/jazz.png'),
  _ClubInfo(name: 'Puzzle Community', logoPath: 'assets/png/clubs/puzzle.png'),
  _ClubInfo(name: 'Go Community', logoPath: 'assets/png/clubs/go.png'),
  _ClubInfo(name: 'Business Community', logoPath: 'assets/png/clubs/business.png'),
  _ClubInfo(name: 'Architecture Community', logoPath: 'assets/png/clubs/architecture.png'),
  _ClubInfo(name: 'Media Community', logoPath: 'assets/png/clubs/media.png'),
  _ClubInfo(name: 'Theatre Group', logoPath: 'assets/png/clubs/theatre.png'),
  _ClubInfo(name: 'Language Community', logoPath: 'assets/png/clubs/language.png'),
  _ClubInfo(name: 'Fine Arts Society(GST)', logoPath: 'assets/png/clubs/fine_art.png'),
  _ClubInfo(name: 'Japanese Cultural Society', logoPath: 'assets/png/clubs/japanese.png'),
  _ClubInfo(name: 'Go Community', logoPath: 'assets/png/clubs/go.png'),
  _ClubInfo(name: 'Business Community', logoPath: 'assets/png/clubs/business.png'),
  _ClubInfo(name: 'Architecture Community', logoPath: 'assets/png/clubs/architecture.png'),
];

class ClubListForm extends StatefulWidget {
  const ClubListForm({super.key});

  static final ScrollController _controller = ScrollController();

  @override
  State<ClubListForm> createState() => _ClubListFormState();
}

class _ClubListFormState extends State<ClubListForm> {
  final TextEditingController _searchController = TextEditingController();
  late List<_ClubInfo> _filteredClubs;

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
                return Container(
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
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
