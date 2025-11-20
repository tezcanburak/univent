import 'package:flutter/material.dart';
import 'package:univent/constants/color.dart';
import 'package:univent/style/common_decorations.dart';

class ClubRegisterForm extends StatelessWidget {
  const ClubRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 130, left: 20, right: 20, bottom: 20),
      decoration: CommonDecorations.lightGreyBackgroundDecoration(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Title
            const Center(
              child: Text("Club Register", style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
            ),

            const SizedBox(height: 12),

            // Subtitle
            const Center(
              child: Text(
                "Please enter the necessary information and\nwait for UNIVENT’s confirmation.",
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 40),

            // Club Name
            const Text("Club Name", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            _input(),

            const SizedBox(height: 20),

            // President Name
            const Text("President Name", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            _input(),

            const SizedBox(height: 20),

            // President Phone
            const Text("President Phone Number (for confirmation)", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            _input(),

            const SizedBox(height: 20),
            const Divider(),

            const SizedBox(height: 20),

            // Club Username
            const Text("Club Username", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            _input(),

            const SizedBox(height: 20),

            // Password
            const Text("Password", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            _input(obscure: true),

            const SizedBox(height: 20),

            // Confirm Password
            const Text("Confirm Password", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            _input(obscure: true),

            const SizedBox(height: 20),
            const Divider(),

            const SizedBox(height: 20),

            // Club METU Mail
            const Text("Club METU Mail", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            _input(),

            const SizedBox(height: 20),

            // Send Code Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.red,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Send Code", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),

            const SizedBox(height: 20),

            // Verification Code
            const Text("Verification Code", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            _input(),

            const SizedBox(height: 12),

            const Center(
              child: Text(
                "Code has sent to your club’s metu.edu.tr e-mail address.\n"
                "Enter the code to send for confirmation.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.black87),
              ),
            ),

            const SizedBox(height: 30),

            // Final Confirm Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.red,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Send for confirmation", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable Input Widget
  static Widget _input({bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
