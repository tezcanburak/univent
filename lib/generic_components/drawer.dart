import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:univent/constants/color.dart';

class UniventDrawer extends StatelessWidget {
  const UniventDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    return Drawer(
      backgroundColor: ColorConstants.black.withValues(alpha: 0.8),
      child: Column(
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: BoxDecoration(color: ColorConstants.black.withValues(alpha: 0.5)),
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.sports_tennis, color: ColorConstants.red, size: 30),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Univent',
                        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      const Text('Hoş geldin, Burak TEZCAN', style: TextStyle(color: Colors.white70, fontSize: 14)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Navigation Items
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Builder(
                  builder: (context) {
                    final bool isActive = GoRouterState.of(context).uri.path == '/';
                    return ListTile(
                      leading: Icon(Icons.home, color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.7)),
                      title: Text(
                        'Home',
                        style: TextStyle(
                          fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                          color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.7),
                        ),
                      ),
                      selected: isActive,
                      selectedTileColor: Colors.white.withValues(alpha: 0.1),
                      onTap: () {
                        Navigator.pop(context);
                        context.go('/');
                      },
                    );
                  }
                ),
                _buildDrawerItem(context, Icons.calendar_today, 'Calendar', '/calendar'),
                _buildDrawerItem(context, Icons.short_text, 'Club List', '/clubList'),
                _buildDrawerItem(context, Icons.edit_calendar_outlined, 'Event List', '/eventList'),
                _buildDrawerItem(context, Icons.settings, 'Settings', '/clubDashboard'),
                _buildDrawerItem(context, Icons.login, 'Club Login', '/clubLogin'),
                _buildDrawerItem(context, Icons.login, 'Student Login', '/studentLogin'),
              ],
            ),
          ),

          // User Section
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey[300]!)),
            ),
            child: true
                ? Row(
                    children: [
                      const Icon(Icons.person, color: Colors.white),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Burak TEZCAN',
                          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // _logout
                        },
                        icon: const Icon(Icons.logout, color: Colors.red),
                        tooltip: 'Çıkış Yap',
                      ),
                    ],
                  )
                : Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            context.go('/login');
                          },
                          child: const Text('Giriş Yap'),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            context.go('/signup');
                          },
                          style: ElevatedButton.styleFrom(backgroundColor: Theme.of(context).primaryColor, foregroundColor: Colors.white),
                          child: const Text('Kayıt Ol'),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, IconData icon, String title, String route) {
    final bool isActive = GoRouterState.of(context).uri.path == route;

    return ListTile(
      leading: Icon(icon, color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.7)),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.7),
        ),
      ),
      selected: isActive,
      selectedTileColor: Colors.white.withValues(alpha: 0.1),
      onTap: () {
        Navigator.pop(context);
        context.push(route);
      },
    );
  }
}
