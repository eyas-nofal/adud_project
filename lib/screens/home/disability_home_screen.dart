import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/models/story_model.dart';
import 'package:adud_project/screens/core/constants/app_colors.dart';
import 'package:adud_project/screens/core/widgets/custom_app_header.dart';
import 'package:adud_project/screens/core/widgets/custom_help_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            title: AppLocalizations.of(context)!.welcomeUser("Ahmad"),
            subTitle: AppLocalizations.of(context)!.howCanWeHelp,
            notifications: 5,
            messages: 3,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 15.h),
                  Text(
                    AppLocalizations.of(context)!.nearbyAccessiblePlaces,
                    style: TextStyle(fontSize: 22),
                  ),
                  SizedBox(height: 15.h),

                  // داخل الـ Column في صفحة الهوم
                  SizedBox(
                    height: 130, // ارتفاع كافي للدوائر والنصوص تحتها
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      reverse: true, // عشان يبلش من اليمين لليسار (عربي)
                      itemCount: stories.length,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: buildStoryItem(context, stories[index]),
                        );
                      },
                    ),
                  ),
                    HelpRequestButton(
                    onTap: () {
                      // هنا ممكن تفتح صفحة الاتصال أو الفورم
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
