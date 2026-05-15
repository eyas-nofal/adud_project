import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/models/help_request_model.dart';
import 'package:adud_project/models/story_model.dart';
import 'package:adud_project/screens/core/constants/app_colors.dart';
import 'package:adud_project/screens/core/widgets/common/custom_app_header.dart';
import 'package:adud_project/screens/core/widgets/buttons/custom_help_button.dart';
import 'package:adud_project/screens/core/widgets/cards/custom_help_request.dart';
import 'package:adud_project/screens/reports/reports_screen.dart';
import 'package:adud_project/screens/requests/create_request_screen.dart';
import 'package:adud_project/screens/core/widgets/cards/partners_card.dart';
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateRequestScreen(),
                        ),
                      );
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
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReportsScreen(),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(20.r),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 15.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.neutral50,
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12.r),
                              decoration: BoxDecoration(
                                color: AppColors.danger50,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.error_outline,
                                color: AppColors.danger500,
                                size: 28.sp,
                              ),
                            ),
                            SizedBox(width: 15.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.reportInaccessiblePlace,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.neutral900,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    AppLocalizations.of(
                                      context,
                                    )!.improveAccessibility,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: AppColors.neutral600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  PartnersSection(
                    partners: [
                      Partner(
                        name: 'BAU',
                        imagePath: 'assets/images/bau.png',
                        backgroundColor: Colors.green.shade200,
                      ),
                      Partner(
                        name: 'Europion Union',
                        imagePath: 'assets/images/eu.png',
                        backgroundColor: Colors.blue.shade200,
                      ),
                      Partner(
                        name: 'NABD',
                        imagePath: 'assets/images/NABD.png',
                        backgroundColor: Colors.grey.shade200,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
