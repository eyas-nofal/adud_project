import 'package:adud_project/screens/home/disability_home_screen.dart';
import 'package:adud_project/screens/home/volunteer_home_screen.dart';
import 'package:adud_project/screens/tools%20donations/donationscreen.dart';
import 'package:flutter/material.dart';

enum UserRole { disabled, volunteer }

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;
  final UserRole userRole;

  NavigationProvider({required this.userRole});

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  List<Widget> get screens => [
    userRole == UserRole.disabled ? const DisabilityHomeScreen() : const VolunteerHomeScreen(),
    const Donationscreen(),
      const Donationscreen(),
        const Donationscreen(),
    
  ];
}