import 'package:flutter/material.dart';
import 'package:smart_hotel/screens/home_page.dart';
import 'package:smart_hotel/screens/bookings_page.dart';
import 'package:smart_hotel/screens/chat_screen.dart';
import 'package:smart_hotel/screens/profile_page.dart';
import 'package:smart_hotel/core/widgets/bottom_nav.dart';

class BottomNavWrapper extends StatefulWidget {
  const BottomNavWrapper({super.key});

  @override
  State<BottomNavWrapper> createState() => _BottomNavWrapperState();
}

class _BottomNavWrapperState extends State<BottomNavWrapper> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomePage(),
    const ChatScreen(),
    const BookingsPage(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
