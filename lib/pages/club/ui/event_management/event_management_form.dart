import 'package:flutter/material.dart';
import 'package:univent/constants/color.dart';
import 'package:univent/style/common_decorations.dart';

class EventManagementForm extends StatelessWidget {
  const EventManagementForm({super.key});

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
              'Event Management',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: ColorConstants.black),
            ),
            const SizedBox(height: 32),

            // Event Name
            Text('Event Name', style: TextStyle(fontSize: 18, color: ColorConstants.black)),
            const SizedBox(height: 8),
            Container(
              decoration: CommonDecorations.border10White(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const TextField(
                decoration: InputDecoration(hintText: 'Enter', border: InputBorder.none),
              ),
            ),

            const SizedBox(height: 24),

            // Place
            Text('Place', style: TextStyle(fontSize: 18, color: ColorConstants.black)),
            const SizedBox(height: 8),
            Container(
              decoration: CommonDecorations.border10White(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const TextField(
                decoration: InputDecoration(hintText: 'Enter', border: InputBorder.none),
              ),
            ),

            const SizedBox(height: 24),

            // Date
            Text('Date', style: TextStyle(fontSize: 18, color: ColorConstants.black)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(right: 8),
                    decoration: CommonDecorations.border10White(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const TextField(
                      decoration: InputDecoration(hintText: 'day', border: InputBorder.none),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: CommonDecorations.border10White(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const TextField(
                      decoration: InputDecoration(hintText: 'month', border: InputBorder.none),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(left: 8),
                    decoration: CommonDecorations.border10White(),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: const TextField(
                      decoration: InputDecoration(hintText: 'year', border: InputBorder.none),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Number of Tickets
            Text('Number of Tickets', style: TextStyle(fontSize: 18, color: ColorConstants.black)),
            const SizedBox(height: 8),
            Container(
              decoration: CommonDecorations.border10White(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const TextField(
                decoration: InputDecoration(hintText: 'Enter(if you are selling tickets)', border: InputBorder.none),
              ),
            ),

            const SizedBox(height: 24),

            // Picture Upload
            Text('Picture', style: TextStyle(fontSize: 18, color: ColorConstants.black)),
            const SizedBox(height: 8),
            Container(
              height: 220,
              decoration: CommonDecorations.border10White(),
              child: Center(child: Icon(Icons.upload, size: 40, color: ColorConstants.red)),
            ),

            const SizedBox(height: 32),

            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(color: ColorConstants.red, borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: ColorConstants.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(color: ColorConstants.red, borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(color: ColorConstants.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
