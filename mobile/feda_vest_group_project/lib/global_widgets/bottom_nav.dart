import 'package:feda_vest_group_project/pages/bottomnav_pages/sme_dashboard.dart';
import 'package:feda_vest_group_project/pages/bottomnav_pages/explore.dart';
import 'package:feda_vest_group_project/pages/bottomnav_pages/profile_screen.dart';
import 'package:feda_vest_group_project/pages/bottomnav_pages/updates.dart';
import 'package:feda_vest_group_project/widgets/dashboard_widgets/notification.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  final screens = const[
    SmeDashboardScreen(),
    ExploreSmesScreen(),
    NotificationScreen(),
    //UpdatesScreen(),
    ProfileScreen(),
  ];
    void changeTab(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     backgroundColor: Color(0xffF4F4F4),
      body: screens[currentIndex],
     bottomNavigationBar: BottomNavigationBar( backgroundColor: const Color(0xff101010),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF14D322),
        unselectedItemColor: const Color(0xFFF8F8F8),
        currentIndex: currentIndex,
        onTap: changeTab,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}