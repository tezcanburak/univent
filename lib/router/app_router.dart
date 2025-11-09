import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:univent/home/ui/home_page.dart';

class AppRouter {
  static const String home = '/';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String makeReservation = '/make-reservation';
  static const String myReservations = '/my-reservations';
  static const String tokenPackages = '/token-packages';
  static const String courts = '/courts';
  static const String reservationDetails = '/reservation-details';
  static const String adminDashboard = '/admin';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(path: home, name: 'home', builder: (context, state) => const HomePage()),
      /*GoRoute(path: login, name: 'login', builder: (context, state) => const LoginPage()),
      GoRoute(path: signup, name: 'signup', builder: (context, state) => const SignUpPage()),
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
