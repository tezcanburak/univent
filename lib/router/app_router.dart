import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:univent/pages/calendar/calendar_page.dart';
import 'package:univent/pages/club/ui/club_info/club_info_page.dart';
import 'package:univent/pages/club/ui/club_list/club_list_form.dart';
import 'package:univent/pages/club/ui/club_list/club_list_page.dart';
import 'package:univent/pages/club/ui/club_management/club_management_page.dart';
import 'package:univent/pages/club/ui/dashboard/club_dashboard_page.dart';
import 'package:univent/pages/club/ui/data_insight/data_insight_page.dart';
import 'package:univent/pages/club/ui/event_management/event_management_page.dart';
import 'package:univent/pages/event/ui/event_info/event_info_page.dart';
import 'package:univent/pages/event/ui/event_list/event_list_page.dart';
import 'package:univent/pages/home/ui/home_page.dart';
import 'package:univent/pages/login/ui/club/club_login_page.dart';
import 'package:univent/pages/login/ui/student/student_login_page.dart';
import 'package:univent/pages/register/club/ui/club_register_page.dart';
import 'package:univent/style/common_decorations.dart';

class AppRouter {
  static const String home = '/';
  static const String clubLogin = '/clubLogin';
  static const String clubRegister = '/clubRegister';
  static const String studentLogin = '/studentLogin';
  static const String clubDashboard = '/clubDashboard';
  static const String dataInsight = '/dataInsight';
  static const String eventManagement = '/eventManagement';
  static const String clubManagement = '/clubManagement';
  static const String eventInfo = '/eventInfo';
  static const String calendar = '/calendar';
  static const String clubList = '/clubList';
  static const String eventList = '/eventList';
  static const String clubInfo = '/clubInfo';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      GoRoute(path: home, name: 'home', builder: (context, state) => const HomePage()),
      GoRoute(path: clubLogin, name: 'clubLogin', builder: (context, state) => const ClubLoginPage()),
      GoRoute(path: clubRegister, name: 'clubRegister', builder: (context, state) => const ClubRegisterPage()),
      GoRoute(path: studentLogin, name: 'studentLogin', builder: (context, state) => const StudentLoginPage()),
      GoRoute(path: clubDashboard, name: 'clubDashboard', builder: (context, state) => const ClubDashboardPage()),
      GoRoute(path: dataInsight, name: 'dataInsight', builder: (context, state) => const DataInsightPage()),
      GoRoute(path: eventManagement, name: 'eventManagement', builder: (context, state) => const EventManagementPage()),
      GoRoute(path: clubManagement, name: 'clubManagement', builder: (context, state) => const ClubManagementPage()),
      GoRoute(path: eventInfo, name: 'eventInfo', builder: (context, state) => const EventInfoPage()),
      GoRoute(path: calendar, name: 'calendar', builder: (context, state) => const CalendarPage()),
      GoRoute(path: clubList, name: 'clubList', builder: (context, state) => const ClubListPage()),
      GoRoute(path: eventList, name: 'eventList', builder: (context, state) => const EventListPage()),
      GoRoute(
        path: clubInfo,
        name: 'clubInfo',
        builder: (context, state) {
          return ClubInfoPage(club: state.extra as ClubInfo);
        },
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      // Using a soft background color or your theme's surface
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. More Stylized Icon with a background circle
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: Colors.red.withOpacity(0.1), shape: BoxShape.circle),
              child: const Icon(
                Icons.explore_off_outlined, // Changed to a "lost" icon
                size: 80,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 32),

            // 2. Clearer Typography
            Text(
              'Eyvah! Yolunuzu mu kaybettiniz?',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, letterSpacing: -0.5),
            ),
            const SizedBox(height: 12),
            Text(
              'Aradığınız sayfa kampüs sınırları içerisinde bulunamadı.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 40),

            // 3. Modernized Button
            InkWell(
              onTap: () => context.go(home),
              borderRadius: BorderRadius.circular(16), // Ensures ripple is rounded
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                decoration: CommonDecorations.gradientGreyDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.home_rounded, color: Colors.white),
                    SizedBox(width: 12),
                    Text(
                      'Ana Sayfaya Dön',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
