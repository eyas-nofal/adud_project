import 'package:adud_project/app.dart';
import 'package:adud_project/screens/auth/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(244, 247, 252, 1),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/imgSVG/globe-svg.svg', width: 80),
              SizedBox(height: 14.h),
              Text(
                "عَضُد",
                style: GoogleFonts.cairo(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                " اختر لغتك | choose your language",
                style: GoogleFonts.roboto(fontSize: 15.sp),
              ),
              SizedBox(height: 50.h),

              _languageButton(
                context,
                title: "العربية",
                subtitle: "اللغة الأساسية",
                locale: const Locale('ar'),
              ),

              SizedBox(height: 17.h),

              _languageButton(
                context,
                title: "English",
                subtitle: "Application language",
                locale: const Locale('en'),
              ),

              SizedBox(height: 30.h),
              Text(
                "يمكنك تغيير اللغة لاحقاً من الإعدادات",
                style: GoogleFonts.cairo(
                  fontSize: 13.sp,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                "You can change the language later in settings",
                style: GoogleFonts.cairo(
                  fontSize: 13.sp,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _languageButton(
    BuildContext context, {
    required String title,
    required String subtitle,
    required Locale locale,
  }) {
    return SizedBox(
      width: 370.w,
      height: 105.h,
      child: ElevatedButton(
        onPressed: () {
          AppRoot.of(context)!.setLocale(locale);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const WelcomeScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.cairo(
                fontSize: 27.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              subtitle,
              style: GoogleFonts.cairo(
                fontSize: 15.sp,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
