import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:univent/constants/color.dart';
import 'package:univent/router/app_router.dart';
import 'package:univent/style/common_decorations.dart';

class ClubLoginForm extends StatelessWidget {
  const ClubLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(top: 130, left: 20, right: 20, bottom: 20),
      decoration: CommonDecorations.lightGreyBackgroundDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title
          const Center(
            child: Text(
              "Club Login",
              style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),

          const SizedBox(height: 8),

          // Subtitle
          const Center(
            child: Text(
              "Please sign in to access your dashboard.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 40),

          // Username label
          const Text("Club Username", style: TextStyle(fontSize: 16, color: Colors.black)),
          const SizedBox(height: 8),

          // Username input
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),

          const SizedBox(height: 20),

          // Password label
          const Text("Password", style: TextStyle(fontSize: 16, color: Colors.black)),
          const SizedBox(height: 8),

          // Password input
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Forgot Password
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Forgot Password?",
              style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),

          const SizedBox(height: 30),

          // Sign In Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              icon: const Icon(Icons.login, color: Colors.white),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstants.red,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              label: const Text("Sign in", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),

          const SizedBox(height: 16),

          // Register Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstants.red,
                padding: const EdgeInsets.symmetric(vertical: 18),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text("Register your club", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),

          const SizedBox(height: 40),

          // Back to Home Page
          Center(
            child: GestureDetector(
              onTap: () => context.go(AppRouter.home),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_back, size: 20),
                  SizedBox(width: 4),
                  Text("Back to Home Page", style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
