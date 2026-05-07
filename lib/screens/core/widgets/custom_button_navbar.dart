import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavigationProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade200, width: 1.w),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: nav.currentIndex,
        onTap: nav.setIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF2196F3),
        unselectedItemColor: Colors.grey.shade500,
        selectedFontSize: 12.sp,
        unselectedFontSize: 12.sp,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
            activeIcon: _buildActiveBox(Icons.home),
            label: AppLocalizations.of(context)!.navHome,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.recycling_outlined),
            label: AppLocalizations.of(context)!.navDonate,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.school_outlined),
            label: AppLocalizations.of(context)!.navWorkshops,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person_outline),
            label: AppLocalizations.of(context)!.navProfile,
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
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Icon(icon, color: const Color(0xFF2196F3)),
    );
  }
}
