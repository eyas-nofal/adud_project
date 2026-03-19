import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/screens/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary100,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 90.h),
              Text(
                AppLocalizations.of(context)!.selectUserType,
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                AppLocalizations.of(context)!.selectUserTypeSub,
                style: TextStyle(fontSize: 15.sp, color: Colors.black),
              ),
              SizedBox(height: 20.h),

              SizedBox(
                width: double.infinity,
                height: 230.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.neutral100,
                    foregroundColor: Colors.black,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.zero,
                  ),

                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        const CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.primary600,
                          child: Icon(
                            Icons.account_circle_outlined,
                            size: 70,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 20.h),

                        Text(
                          AppLocalizations.of(context)!.disabilityUser,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary400,
                          ),
                        ),
                        SizedBox(height: 20.h),

                        Text(
                          AppLocalizations.of(context)!.disabilityUserDesc,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                width: double.infinity,
                height: 230.h,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.neutral100,
                    foregroundColor: Colors.black,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.zero,
                  ),

                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        const CircleAvatar(
                          radius: 50,
                          backgroundColor: AppColors.success600,
                        child: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 80,
                      ),
                    ),
                        SizedBox(height: 20.h),

                        Text(
                          AppLocalizations.of(context)!.volunteer,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary400,
                          ),
                        ),
                        SizedBox(height: 20.h),

                        Text(
                          AppLocalizations.of(context)!.volunteerDesc,
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Text(
                AppLocalizations.of(context)!.canChangeTypeLater,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
