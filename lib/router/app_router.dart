import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:univent/pages/club/ui/club_management/club_management_page.dart';
import 'package:univent/pages/club/ui/dashboard/club_dashboard_page.dart';
import 'package:univent/pages/club/ui/data_insight/data_insight_page.dart';
import 'package:univent/pages/club/ui/event_management/event_management_page.dart';
import 'package:univent/pages/home/ui/home_page.dart';
import 'package:univent/pages/login/ui/club/club_login_page.dart';
import 'package:univent/pages/login/ui/student/student_login_page.dart';
import 'package:univent/register/club/ui/club_register_page.dart';

class AppRouter {
  static const String home = '/';
  static const String clubLogin = '/clubLogin';
  static const String clubRegister = '/clubRegister';
  static const String studentLogin = '/studentLogin';
  static const String clubDashboard = '/clubDashboard';
  static const String dataInsight = '/dataInsight';
  static const String eventManagement = '/eventManagement';
  static const String clubManagement = '/clubManagement';


  static final GoRouter router = GoRouter(
    initialLocation: clubManagement,
    routes: [
      GoRoute(path: home, name: 'home', builder: (context, state) => const HomePage()),
      GoRoute(path: clubLogin, name: 'clubLogin', builder: (context, state) => const ClubLoginPage()),
      GoRoute(path: clubRegister, name: 'clubRegister', builder: (context, state) => const ClubRegisterPage()),
      GoRoute(path: studentLogin, name: 'studentLogin', builder: (context, state) => const StudentLoginPage()),
      GoRoute(path: clubDashboard, name: 'clubDashboard', builder: (context, state) => const ClubDashboardPage()),
      GoRoute(path: dataInsight, name: 'dataInsight', builder: (context, state) => const DataInsightPage()),
      GoRoute(path: eventManagement, name: 'eventManagement', builder: (context, state) => const EventManagementPage()),
      GoRoute(path: clubManagement, name: 'clubManagement', builder: (context, state) => const ClubManagementPage()),
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
