import 'package:flutter/material.dart';
import 'package:univent/constants/color.dart';
import 'package:univent/pages/club/ui/club_list/club_list_form.dart';
import 'package:univent/style/common_decorations.dart';

class ClubInfoForm extends StatelessWidget {
  const ClubInfoForm({super.key, required this.club});

  final ClubInfo club;

  @override
  Widget build(BuildContext context) {
    final description = (club.description).trim().isNotEmpty
        ? club.description.trim()
        : "The ${club.name} is a student society at Middle East Technical University (ODTÜ) in Ankara, Turkey, focused on media and communication.\n\n"
              "The club provides a platform for students to:\n"
              "• Create Content: Produce short films, documentaries, radio broadcasts, and digital media projects.\n"
              "• Learn Skills: Offer practical training in areas like video editing, scriptwriting, and photography.\n"
              "• Host Events: Organize film screenings, seminars, and talks on media literacy, journalism, and visual culture.\n\n"
              "It's a hands-on environment for students to gain experience and critical understanding in the world of media.";

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      margin: const EdgeInsets.only(top: 130, left: 20, right: 20, bottom: 20),
      decoration: CommonDecorations.lightGreyBackgroundDecoration(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _CardShell(
              child: AspectRatio(
                aspectRatio: 1.6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: Image.asset(
                    club.logoPath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(child: Icon(Icons.image_not_supported_outlined, size: 48, color: Colors.grey.shade500));
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            _CardShell(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 16),
                child: Text(
                  club.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: _DescriptionBlock(text: description),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Follow action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.red,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Follow', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardShell extends StatelessWidget {
  const _CardShell({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 18, offset: const Offset(0, 8))],
      ),
      padding: const EdgeInsets.all(18),
      child: child,
    );
  }
}

class _DescriptionBlock extends StatelessWidget {
  const _DescriptionBlock({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final lines = text.split('\n').map((e) => e.trimRight()).toList();

    final widgets = <Widget>[];
    for (final line in lines) {
      final trimmed = line.trim();
      if (trimmed.isEmpty) {
        widgets.add(const SizedBox(height: 10));
        continue;
      }

      // Bullet line (supports leading "•")
      if (trimmed.startsWith('•')) {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(left: 6, bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('• ', style: TextStyle(fontSize: 14, height: 1.4)),
                Expanded(
                  child: Text(trimmed.substring(1).trimLeft(), style: const TextStyle(fontSize: 14, height: 1.4, color: Colors.white)),
                ),
              ],
            ),
          ),
        );
      } else {
        widgets.add(
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(trimmed, style: const TextStyle(fontSize: 14, height: 1.4)),
          ),
        );
      }
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: widgets);
  }
}
