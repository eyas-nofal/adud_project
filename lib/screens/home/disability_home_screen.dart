import 'package:adud_project/screens/core/constants/app_colors.dart';
import 'package:adud_project/screens/core/widgets/custom_app_header.dart';
import 'package:flutter/material.dart';

class DisabilityHomeScreen extends StatefulWidget {
  const DisabilityHomeScreen({super.key});

  @override
  State<DisabilityHomeScreen> createState() => _DisabilityHomeScreenState();
}

class _DisabilityHomeScreenState extends State<DisabilityHomeScreen> {






  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: AppColors.primary100,
      body: Column(
        children: [
          CustomAppHeader(
            title: " مرحبا اياس",
            subTitle: "كيف يمكننا مساعدتك اليوم؟",
            notifications: 5,
            messages: 3,
          ),
          Expanded(
            child: SingleChildScrollView(child: Column(children: [

    ],
  )),
          ),
        ],
      ),
    );
  }
  
}
