import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:univent/constants/color.dart';
import 'package:univent/style/common_decorations.dart';

class EventInfoForm extends StatelessWidget {
  const EventInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args = {};
    // Prefer go_router extra
    final extra = GoRouterState.of(context).extra;
    if (extra is Map<String, dynamic>) {
      args = extra;
    } else {
      final navArgs = ModalRoute.of(context)?.settings.arguments;
      if (navArgs is Map<String, dynamic>) args = navArgs;
    }

    final String image = (args['image'] ?? 'assets/png/image_16.png') as String;
    final String name = (args['name'] ?? 'Event Name') as String;
    final String location = (args['location'] ?? '-') as String;
    final String date = (args['date'] ?? '-') as String;
    final String cost = (args['cost'] ?? '') as String;

    final width = MediaQuery.sizeOf(context).width;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(top: 130, left: 20, right: 20, bottom: 20),
        decoration: CommonDecorations.lightGreyBackgroundDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Poster Card
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.12), blurRadius: 18, offset: const Offset(0, 8))],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(image, width: width, fit: BoxFit.cover),
              ),
            ),

            const SizedBox(height: 14),

            // White Info Card
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.10), blurRadius: 12, offset: const Offset(0, 6))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(height: 6),
                  const Text('by METUBIZ', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black87, fontSize: 14, height: 1.4),
                      children: [
                        const TextSpan(
                          text: 'Location: ',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(text: location),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black87, fontSize: 14, height: 1.4),
                      children: [
                        const TextSpan(
                          text: 'Date / Time: ',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        TextSpan(text: date),
                      ],
                    ),
                  ),
                  if (cost.isNotEmpty) ...[
                    const SizedBox(height: 4),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(color: Colors.black87, fontSize: 14, height: 1.4),
                        children: [
                          const TextSpan(
                            text: 'Fee: ',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          TextSpan(
                            text: cost,
                            style: TextStyle(color: ColorConstants.red, fontWeight: FontWeight.w800),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const SizedBox(height: 18),

            // Description
            const Text(
              'Get ready for the\n'
              'Last Call for the Sunglasses\n\n'
              'Party presented by\n'
              'CHEERS FEST and METUBIZ!\n'
              'Join us for a night of epic music and good vibes\n'
              'featuring DJ NX. Throw on your coolest shades\n'
              'and hit the dance floor!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.5, height: 1.45, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 18),

            // Like Button
            SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                ),
                child: const Text(
                  'Like',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Participate Button
            SizedBox(
              height: 52,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                ),
                child: const Text(
                  'May participate',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Comment Field
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 10, offset: const Offset(0, 4))],
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(hintText: 'Write a comment', border: InputBorder.none, isDense: true),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 40,
                    width: 44,
                    decoration: BoxDecoration(color: ColorConstants.red, borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
