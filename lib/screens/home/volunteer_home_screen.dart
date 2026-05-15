import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/screens/core/constants/app_colors.dart';
import 'package:adud_project/screens/core/widgets/common/custom_app_header.dart';
import 'package:adud_project/screens/core/widgets/cards/Disability_Request_Card_inVolunteerPage.dart';
import 'package:adud_project/screens/core/widgets/cards/custom_reward_offerds.dart';
import 'package:adud_project/screens/core/widgets/cards/partners_card.dart';
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.h), 
                  
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Column(
                      children: [
                        // --- بداية تصميم بطاقة نقاط المكافآت ---
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                          margin: EdgeInsets.only(bottom: 25.h), // مسافة بين النقاط والطلبات القريبة
                          decoration: BoxDecoration(
                            // يمكنك تعديل اللون ليتناسب مع درجة لون التطبيق لديك
                            color: const Color(0xFF26C6DA).withOpacity(0.2), 
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Row(
                            children: [
                              // أيقونة النجمة على اليمين
                              Container(
                                padding: EdgeInsets.all(8.w),
                                decoration: const BoxDecoration(
                                  color: Colors.amber, // اللون الأصفر الدائري
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.star_border_rounded, // يمكنك تغييرها لـ Icons.star إذا بدك اياها معبأة
                                  color: Colors.black87,
                                  size: 28,
                                ),
                              ),
                              SizedBox(width: 15.w),
                              // نصوص النقاط
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppLocalizations.of(context)!.rewardPoints, // استخدام الترجمة كما طلبت
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  Text(
                                    "150 نقطة",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // --- نهاية تصميم بطاقة نقاط المكافآت ---

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.nearbyRequests,
                              style: const TextStyle(
                                fontSize: 20,
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
                              child: const Text(
                                "3 طلبات ",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.success600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.w),
                        DisabilityRequestCard(
                          name: 'آية',
                          category: 'تنقل ومواصلات',
                          distance: '0.8 كم',
                          time: 'الآن',
                          duration: 'ساعة واحدة',
                          onAccept: () {},
                        ),
                        SizedBox(height: 15.w),
                        Row(
                          children: [
                            const Icon(
                              Icons.celebration_outlined,
                              color: Colors.purpleAccent,
                              size: 28,
                            ),
                            SizedBox(width: 15.w),
                            Text(
                              AppLocalizations.of(context)!.rewardOffers,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.w),
                        CustomRewardCard(
                          userPoints: 150,
                          reward: RewardModel(
                            titleAr: "قسيمة خصم للمتجر الصحي",
                            titleEn: "Healthy Store Discount",
                            pointsRequired: 100,
                            iconPath: "🍕",
                          ),
                          onRedeem: () {},
                        ),
                        SizedBox(height: 12.h),
                        CustomRewardCard(
                          userPoints: 150,
                          reward: RewardModel(
                            titleAr: "اشتراك شهر مجاني في النادي",
                            titleEn: "Free month gym membership",
                            pointsRequired: 200,
                            iconPath: "❤️",
                          ),
                          onRedeem: () {},
                        ),
                      ],
                    ),
                  ),
                  
                  SizedBox(height: 30.h),
                  
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