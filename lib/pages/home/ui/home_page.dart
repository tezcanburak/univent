import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:univent/constants/color.dart';
import 'package:univent/style/common_decorations.dart';

import 'home_form.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: true,
      child: PopScope(
        canPop: false,
        child: Scaffold(
          extendBody: true,
          extendBodyBehindAppBar: false,
          appBar: AppBar(
            /// This color for Drawer's Hamburger Icon!!!
            iconTheme: IconThemeData(color: Colors.white),
            centerTitle: true,
            title: SvgPicture.asset('assets/svg/univent.svg'),
            flexibleSpace: Container(decoration: CommonDecorations.appBarGreyDecoration()),
          ),
          body: Stack(
            children: [
              Container(width: MediaQuery.sizeOf(context).width, height: MediaQuery.sizeOf(context).height, color: Colors.black.withValues(alpha: 0.6)),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                child: Image(image: AssetImage('assets/png/devrim.png'), fit: BoxFit.cover),
              ),
              Container(
                color: ColorConstants.white.withValues(alpha: 0.5),
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
              ),
              const HomeForm(),
            ],
          ),
          endDrawer: _buildDrawer(context),
        ),
      ),
    );
  }

  Widget _buildDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: BoxDecoration(color: ColorConstants.red),
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
                      Text('Hoş geldin, Burak TEZCAN', style: const TextStyle(color: Colors.white70, fontSize: 14)),
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
              //  _buildDrawerItem(context, Icons.home, 'Home', '/'),
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
                      const Icon(Icons.person, color: Colors.grey),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text('Burak TEZCAN', style: const TextStyle(fontWeight: FontWeight.w500)),
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
      leading: Icon(icon, color: isActive ? Theme.of(context).primaryColor : Colors.grey[600]),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          color: isActive ? Theme.of(context).primaryColor : Colors.grey[700],
        ),
      ),
      selected: isActive,
      selectedTileColor: Theme.of(context).primaryColor.withValues(alpha: 0.1),
      onTap: () {
        Navigator.pop(context);
        context.push(route);
      },
    );
  }
}
