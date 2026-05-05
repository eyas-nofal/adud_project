import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/screens/core/constants/app_colors.dart';
import 'package:adud_project/screens/core/widgets/custom_app_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VolunteerHomeScreen extends StatefulWidget {
  const VolunteerHomeScreen({super.key});

  @override
  State<VolunteerHomeScreen> createState() => _VolunteerHomeScreenState();
}

class _VolunteerHomeScreenState extends State<VolunteerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary100,
      body: Column(
        children: [
          SingleChildScrollView(
            child: CustomAppHeader(
              title: AppLocalizations.of(context)!
                  .welcomeUser("Ahmad"),
              subTitle: AppLocalizations.of(context)!
                  .thanksForGiving,
              notifications: 5,
              messages: 3,
            ),
          ),
          Expanded(
            //child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ),
            ),
        //  ),
        ],
      ),
    );
  }
}