import 'package:adud_project/screens/hub/tools_list_screen.dart';
import 'package:adud_project/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
// استيراد الشاشات الخاصة بك
import 'package:adud_project/screens/home/disability_home_screen.dart';
import 'package:adud_project/screens/home/volunteer_home_screen.dart';

enum UserRole { disabled, volunteer }

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;
  late UserRole _userRole;

  NavigationProvider({required UserRole userRole}) : _userRole = userRole;

  int get currentIndex => _currentIndex;
  UserRole get userRole => _userRole;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void updateUserRole(UserRole newRole) {
    _userRole = newRole;
    _currentIndex = 0;
    notifyListeners();
  }

  List<Widget> get screens => [
    // التبويب 0: الرئيسية المتغيرة
    _userRole == UserRole.disabled
        ? const DisabilityHomeScreen()
        : const VolunteerHomeScreen(),

    // التبويب 1: التبرع
    const DonationScreen(),

    // التبويب 2: الورش (استبدلها بالشاشة الحقيقية لاحقاً)
    const Center(child: Text('صفحة الورش')),

    // التبويب 3: حسابي (استبدلها بالشاشة الحقيقية لاحقاً)
    const ProfileScreen(),
  ];
}
