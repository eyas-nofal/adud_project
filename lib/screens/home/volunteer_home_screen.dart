import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/screens/core/constants/app_colors.dart';
import 'package:adud_project/screens/core/widgets/custom_app_header.dart';
import 'package:adud_project/screens/core/widgets/Disability_Request_Card.dart';
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
              title: AppLocalizations.of(context)!.welcomeUser("Ahmad"),
              subTitle: AppLocalizations.of(context)!.thanksForGiving,
              notifications: 5,
              messages: 3,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.nearbyRequests,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.success100,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "3 طلبات ",
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: AppColors.success600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    DisabilityRequestCard(
                      name: 'آية',
                      category: 'تنقل ومواصلات',
                      distance: '0.8 كم',
                      time: 'الآن',
                      duration: 'ساعة واحدة',
                      price: 10.0, // هنا مررنا السعر، فستظهر الأيقونة الخضراء
                      onAccept: () {
                        print('تم قبول طلب آية');
                      },
                    ),
                    DisabilityRequestCard(
                      name: 'عمر',
                      category: 'مرافقة',
                      distance: '1.5 كم',
                      time: 'بعد ساعة',
                      duration: 'ساعتان',
                      // لم نقم بتمرير المتغير price هنا، لذلك لن تظهر أيقونة الدفع
                      onAccept: () {
                        print('تم قبول طلب محمد');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
