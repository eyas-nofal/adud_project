import 'dart:ui';

import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/providers/language_provider.dart';
import 'package:adud_project/screens/auth/create_new_account.dart';
import 'package:adud_project/screens/auth/login_screen.dart';
import 'package:adud_project/screens/core/widgets/custom_button.dart';
import 'package:adud_project/screens/core/widgets/custom_glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    final currentLocale = Localizations.localeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,

        leadingWidth: 200.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 1.w, top: 10.h),
          child: Center(
            child: CustomGlassContainer(
          onTab: () => context.read<LanguageProvider>().toggleLocale(),
          size: 150, 
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.language, color: Colors.white, size: 20.sp),
                SizedBox(width: 15.w),
                Text(
                  currentLocale.languageCode == 'en' ? 'العربية' : 'English',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          ),
        ),
      ),
      ),
      backgroundColor: Colors.blue,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomGlassContainer(
                size: 100,
                onTab: () {
                },
                child: SvgPicture.asset(
                  'assets/imgSVG/handheart.svg',
                  width: 100.w, 
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              SizedBox(height: 25.h),

              Text(
                AppLocalizations.of(context)!.appName,
                style: TextStyle(
                  fontSize: 50.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                AppLocalizations.of(context)!.appTagline,
                style: TextStyle(
                  fontSize: 20.sp,
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateNewAccount(),
                    ),
                  );
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
              SizedBox(height: 40.h),
              SvgPicture.asset(
                'assets/imgSVG/heart1.svg',
                width: 30.w,
                color: Colors.white,
              ),
              SizedBox(height: 5.h),

              Text(
                AppLocalizations.of(context)!.togetherWeMakeDifference,
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
