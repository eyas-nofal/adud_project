import 'package:adud_project/screens/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RewardModel {
  final String titleAr;
  final String titleEn;
  final int pointsRequired;
  final String iconPath;

  RewardModel({
    required this.titleAr,
    required this.titleEn,
    required this.pointsRequired,
    required this.iconPath,
  });
}

class CustomRewardCard extends StatelessWidget {
  final RewardModel reward;
  final int userPoints;
  final VoidCallback onRedeem;

  const CustomRewardCard({
    super.key,
    required this.reward,
    required this.userPoints,
    required this.onRedeem,
  });

  @override
  Widget build(BuildContext context) {
    final bool isEnabled = userPoints >= reward.pointsRequired;
    final bool isArabic =
        Localizations.localeOf(context).languageCode == 'ar';

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(40.w),
      decoration: BoxDecoration(
        color: AppColors.neutral50,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral900.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        textDirection:
            isArabic ? TextDirection.rtl : TextDirection.ltr,
        children: [
          Container(
            width: 60.w,
            height: 60.h,
            decoration: BoxDecoration(
              color: AppColors.secondary50,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Center(
              child: Text(
                reward.iconPath,
                style: TextStyle(fontSize: 28.sp),
              ),
            ),
          ),

          SizedBox(width: 12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isArabic
                      ? reward.titleAr
                      : reward.titleEn,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.neutral900,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 6.h),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.stars_rounded,
                      size: 16.sp,
                      color: AppColors.secondary500,
                    ),

                    SizedBox(width: 4.w),

                    Text(
                      "${reward.pointsRequired} ${isArabic ? 'نقطة' : 'Points'}",
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: AppColors.secondary600,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(
            height: 36.h,
            child: ElevatedButton(
              onPressed: isEnabled ? onRedeem : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: isEnabled
                    ? AppColors.neutral200
                    : AppColors.neutral100,
                disabledBackgroundColor:
                    AppColors.primary50,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.r),
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 14.w,
                ),
              ),
              child: Text(
                isArabic ? "استبدل" : "Redeem",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: isEnabled
                      ? AppColors.neutral700
                      : AppColors.neutral400,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}