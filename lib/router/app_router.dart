import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:univent/home/ui/home_page.dart';
import 'package:univent/login/ui/club/club_login_page.dart';
import 'package:univent/login/ui/student/student_login_page.dart';
import 'package:univent/register/club/ui/club_register_page.dart';

class AppRouter {
  static const String home = '/';
  static const String clubLogin = '/clubLogin';
  static const String clubRegister = '/clubRegister';
  static const String studentLogin = '/studentLogin';


  static final GoRouter router = GoRouter(
    initialLocation: studentLogin,
    routes: [
      GoRoute(path: home, name: 'home', builder: (context, state) => const HomePage()),
      GoRoute(path: clubLogin, name: 'clubLogin', builder: (context, state) => const ClubLoginPage()),
      GoRoute(path: clubRegister, name: 'clubRegister', builder: (context, state) => const ClubRegisterPage()),
      GoRoute(path: studentLogin, name: 'studentLogin', builder: (context, state) => const StudentLoginPage()),
     /* GoRoute(path: signup, name: 'signup', builder: (context, state) => const SignUpPage()),
      GoRoute(path: makeReservation, name: 'makeReservation', builder: (context, state) => const MakeReservationPageResponsive()),
      GoRoute(path: myReservations, name: 'myReservations', builder: (context, state) => const MyReservationsPage()),
      GoRoute(path: tokenPackages, name: 'tokenPackages', builder: (context, state) => const TokenPackagesPage()),
      GoRoute(path: courts, name: 'courts', builder: (context, state) => const CourtsPageNew()),
     */
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Sayfa bulunamadı', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('Aradığınız sayfa mevcut değil.', style: Theme.of(context).textTheme.bodyMedium),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: () => context.go(home), child: const Text('Ana Sayfaya Dön')),
          ],
        ),
      ),
    ),
  );
}
