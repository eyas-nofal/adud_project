import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/models/help_request_model.dart';
import 'package:adud_project/models/story_model.dart';
import 'package:adud_project/screens/core/constants/app_colors.dart';
import 'package:adud_project/screens/core/widgets/common/custom_app_header.dart';
import 'package:adud_project/screens/core/widgets/buttons/custom_help_button.dart';
import 'package:adud_project/screens/core/widgets/cards/custom_help_request.dart';
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
                    height: 110, // ارتفاع كافي للدوائر والنصوص تحتها
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
                  HelpCardWidget(
                    request: HelpRequestModel(
                      id: "1",
                      title: "تنقل ومواصلات",
                      userName: "أحمد",
                      duration: "المدة: 1 ساعة",
                      timeInfo: "جارية منذ 16 دقيقة",
                      status: HelpStatus.active,
                      themeColor: 0xFF2196F3,
                      icon: Icons.people,
                    ),
                  ),

                  // البطاقة الثانية (قادمة)
                  HelpCardWidget(
                    request: HelpRequestModel(
                      id: "2",
                      title: "مرافقة",
                      userName: "ليان",
                      duration: "المدة: 3 ساعات",
                      timeInfo: "بعد 1 ساعة",
                      status: HelpStatus.upcoming,
                      themeColor: 0xFF9C27B0, //
                      icon: Icons.people,
                    ),
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
