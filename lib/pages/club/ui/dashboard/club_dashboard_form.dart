import 'package:flutter/material.dart';
import 'package:univent/constants/color.dart';
import 'package:univent/style/common_decorations.dart';

class ClubDashboardForm extends StatelessWidget {
  const ClubDashboardForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      margin: const EdgeInsets.only(top: 130, left: 20, right: 20, bottom: 20),
      decoration: CommonDecorations.lightGreyBackgroundDecoration(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'X Club',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: ColorConstants.black),
            ),
            const SizedBox(height: 20),

            // Stats Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: CommonDecorations.border10White(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(children: [Icon(Icons.visibility), SizedBox(width: 10), Text('10.729 views')]),
                  SizedBox(height: 10),
                  Row(children: [Icon(Icons.favorite), SizedBox(width: 10), Text('120 likes')]),
                  SizedBox(height: 10),
                  Row(children: [Icon(Icons.event), SizedBox(width: 10), Text('3 events')]),
                  SizedBox(height: 10),
                  Row(children: [Icon(Icons.comment), SizedBox(width: 10), Text('16 comments')]),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Events Table Label
            Text(
              'Events [3]',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: ColorConstants.black),
            ),
            const SizedBox(height: 10),

            // Events Table
            Container(
              padding: const EdgeInsets.all(16),
              decoration: CommonDecorations.border10White(),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _HeaderBox(title: 'Event Name'),
                      _HeaderBox(title: 'Date'),
                      _HeaderBox(title: 'Place'),
                      _HeaderBox(title: 'Status'),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _ValueBox(value: 'Workshop'),
                      _ValueBox(value: '11/11/25'),
                      _ValueBox(value: 'U1'),
                      _ValueBox(value: 'Active'),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _ValueBox(value: 'Event Name'),
                      _ValueBox(value: 'Date'),
                      _ValueBox(value: 'Place'),
                      _ValueBox(value: 'Status'),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _ValueBox(value: 'Event Name'),
                      _ValueBox(value: 'Date'),
                      _ValueBox(value: 'Place'),
                      _ValueBox(value: 'Status'),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _ValueBox(value: 'Event Name'),
                      _ValueBox(value: 'Date'),
                      _ValueBox(value: 'Place'),
                      _ValueBox(value: 'Status'),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 30),

            // Buttons
            _RedButton(label: 'Club Page Management'),
            SizedBox(height: 16),
            _RedButton(label: 'Event Creation'),
            SizedBox(height: 16),
            _RedButton(label: 'Event Management'),
            SizedBox(height: 16),
            _RedButton(label: 'Data & Insights'),
          ],
        ),
      ),
    );
  }
}

class _HeaderBox extends StatelessWidget {
  final String title;

  const _HeaderBox({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 6,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(color: ColorConstants.red, borderRadius: BorderRadius.circular(10)),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _ValueBox extends StatelessWidget {
  final String value;

  const _ValueBox({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width / 6,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(color: ColorConstants.lightGrey, borderRadius: BorderRadius.circular(10)),
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(color: ColorConstants.black),
      ),
    );
  }
}

class _RedButton extends StatelessWidget {
  final String label;

  const _RedButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(color: ColorConstants.red, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
