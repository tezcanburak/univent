import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:univent/constants/color.dart';
import 'package:univent/style/common_decorations.dart';

class ClubManagementForm extends StatelessWidget {
  const ClubManagementForm({super.key});

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
              'Club Page Management',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: ColorConstants.black),
            ),
            SizedBox(height: 32),
        
            Text('Enter your community name', style: TextStyle(fontSize: 18, color: ColorConstants.black)),
            SizedBox(height: 8),
            Container(
              decoration: CommonDecorations.border10White(),
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: const TextField(
                decoration: InputDecoration(hintText: 'Enter', border: InputBorder.none),
              ),
            ),
        
            SizedBox(height: 24),
        
            Text('Enter your community introduction text', style: TextStyle(fontSize: 18, color: ColorConstants.black)),
            SizedBox(height: 8),
            Container(
              decoration: CommonDecorations.border10White(),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const TextField(
                maxLines: 3,
                decoration: InputDecoration(hintText: 'Enter', border: InputBorder.none),
              ),
            ),
        
            SizedBox(height: 24),
        
            Text('Select your club category', style: TextStyle(fontSize: 18, color: ColorConstants.black)),
            SizedBox(height: 8),
            Container(
              decoration: CommonDecorations.border10White(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // TOP PART (white background, arrow icon)
                  Container(
                    height: 60,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: ColorConstants.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 28,
                          width: 28,
                          child: SvgPicture.asset('assets/svg/arrow_down.svg'),
                        ),
                      ],
                    ),
                  ),
                  // BOTTOM PART (semi–transparent white background, categories + git icon)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: ColorConstants.white.withValues(alpha: 0),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Category 1",
                                style: TextStyle(fontSize: 24, color: ColorConstants.black)),
                            SizedBox(height: 6),
                            Text("Category 2",
                                style: TextStyle(fontSize: 24, color: ColorConstants.black)),
                          ],
                        ),
                        SizedBox(
                          height: 32,
                          width: 32,
                          child: SvgPicture.asset('assets/svg/git_commit.svg'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        
            SizedBox(height: 24),
        
            Text('Picture', style: TextStyle(fontSize: 18, color: ColorConstants.black)),
            SizedBox(height: 8),
            Container(
              height: 220,
              decoration: CommonDecorations.border10White(),
              child: Center(child: Icon(Icons.upload, size: 40, color: ColorConstants.red)),
            ),
        
            SizedBox(height: 32),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(color: ColorConstants.red, borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: ColorConstants.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
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
