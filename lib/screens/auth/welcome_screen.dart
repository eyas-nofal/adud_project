import 'dart:ui';

import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/screens/auth/login_screen.dart';
import 'package:adud_project/screens/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(28.r),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: 100.w,
                    height: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(28.r),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.2),
                        width: 1,
                      ),
                      
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/imgSVG/handheart.svg',
                        width: 100.w,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              Text(
                AppLocalizations.of(context)!.appName,
                style: TextStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                AppLocalizations.of(context)!.appTagline,
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40.h),
              Text(
                AppLocalizations.of(context)!.appDescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 40.h),

              CustomButton(
                width: 1000.w,
                height: 50.h,
                backgroundColor: Colors.white,
                textColor: Colors.blue,
                text: AppLocalizations.of(context)!.createAccount,
                onPressed: () {
                  
                },
              ),
              SizedBox(height: 20.h),

              CustomButton(
                width: 1000.w,
                height: 50.h,
                backgroundColor: Colors.white,
                textColor: Colors.blue,
                text: AppLocalizations.of(context)!.login,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
