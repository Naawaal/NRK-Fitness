import 'package:flutter/material.dart';
import 'package:nrk_fitness/app/ui/pages/07gym_screen/gym_screen.dart';
import 'package:nrk_fitness/app/ui/pages/08profile_screen/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> children = [
    const GymScreen(),
    const ProfileScreen(),
  ];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 40,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            activeIcon: Image.asset('assets/png/active_gym.png'),
            icon: Image.asset(
              'assets/png/Black.png',
              color: Colors.black,
              fit: BoxFit.cover,
            ),
            label: 'Gym',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/png/active_profile.png',
              fit: BoxFit.cover,
            ),
            icon: Image.asset(
              'assets/png/profile.png',
              fit: BoxFit.cover,
            ),
            label: 'Profile',
          ),
        ],
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          color: Color(0xffF70000),
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          color: Colors.black,
        ),
      ),
    );
  }
}
