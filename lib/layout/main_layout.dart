import 'package:adud_project/providers/navigation_provider.dart';
import 'package:adud_project/screens/core/widgets/custom_button_navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Provider.of<NavigationProvider>(context);

    return Scaffold(
      // عرض الشاشة الحالية بناءً على الاندكس
      body: IndexedStack(
        index: nav.currentIndex,
        children: nav.screens,
      ),
      // استدعاء الويدجت التي أنشأناها في ملف مستقل
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}