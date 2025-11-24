import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:univent/constants/color.dart';
import 'package:univent/router/app_router.dart';
import 'package:univent/style/common_decorations.dart';

class StudentLoginForm extends StatelessWidget {
  const StudentLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      margin: const EdgeInsets.only(top: 130, left: 20, right: 20, bottom: 20),
      decoration: CommonDecorations.lightGreyBackgroundDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title
          Text(
            'Student Login',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          // Subtitle
          Text('Please sign in to access UNIVENT.', textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),

          const SizedBox(height: 32),

          // Metu Mail label
          const Text('Metu Mail', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),

          // Metu Mail text field
          const TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide.none),
            ),
            keyboardType: TextInputType.emailAddress,
          ),

          const SizedBox(height: 20),

          // Send Code button
          SizedBox(
            height: 64,
            child: ElevatedButton(
              onPressed: () {
                // TODO: send code
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstants.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
              ),
              child: const Text(
                'Send Code',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),

          const SizedBox(height: 28),

          // Confirmation Code label
          const Text('Confirmation Code', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),

          // Confirmation Code text field
          const TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10)), borderSide: BorderSide.none),
            ),
            keyboardType: TextInputType.number,
          ),

          const SizedBox(height: 20),

          // Login button
          SizedBox(
            height: 64,
            child: ElevatedButton(
              onPressed: () => context.go(AppRouter.home),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstants.red,
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.login, size: 26, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 28),

          // Info text
          Text.rich(
            TextSpan(
              text: 'Code has sent to your ',
              children: [
                const TextSpan(
                  text: 'metu.edu.tr',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const TextSpan(text: ' e-mail address.\nEnter the code to login.'),
              ],
            ),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          const SizedBox(height: 24),

          // Error text
          Text.rich(
            const TextSpan(
              text:
                  'You entered a different e-mail address.\n'
                  'Only ',
              children: [
                TextSpan(
                  text: 'METU',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: ' students can use this app.'),
              ],
            ),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),

          const SizedBox(height: 32),

          // Club Login button
          SizedBox(
            height: 64,
            child: ElevatedButton(
              onPressed: () => context.push(AppRouter.clubLogin),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstants.black,
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(10)),
              ),
              child: const Text(
                'CLUB LOGIN',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
