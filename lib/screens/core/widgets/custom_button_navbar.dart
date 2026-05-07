import 'package:adud_project/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavigationProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200, width: 1)),
      ),
      child: BottomNavigationBar(
        currentIndex: nav.currentIndex,
        onTap: nav.setIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF2196F3),
        unselectedItemColor: Colors.grey.shade500,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: _buildActiveBox(Icons.home), // الشكل المظلل في الصورة
            label: 'الرئيسية',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.recycling_outlined),
            label: 'التبرع',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            label: 'الورش',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'حسابي',
          ),
        ],
      ),
    );
  }

  Widget _buildActiveBox(IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(icon, color: const Color(0xFF2196F3)),
    );
  }
}