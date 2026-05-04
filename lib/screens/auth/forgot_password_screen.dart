import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/screens/core/constants/app_colors.dart';
import 'package:adud_project/screens/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.primary100,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(50.r),
                    child: CircleAvatar(
                      radius: 22.r,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.arrow_back_ios_new, size: 18),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 60.h),

            Text(
              loc.forgotPassword,
              style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10.h),

            Text(
              "loc.forgotPasswordSubtitle",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
            ),

            SizedBox(height: 30.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      loc.email,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    TextField(
                      decoration: InputDecoration(
                        hintText: "loc.emailHint",
                        prefixIcon: const Icon(Icons.email_outlined),
                        filled: true,
                        fillColor: Colors.grey[100],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),

                    SizedBox(height: 20.h),

                    CustomButton(
                      width: double.infinity,
                      height: 50,
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                      text: "loc.sendResetLink",
                      onPressed: () {},
                    ),

                    SizedBox(height: 15.h),

                    Center(
                      child: Text(
                        "loc.rememberPasswordLogin",
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            Padding(
              padding: EdgeInsets.only(bottom: 20.h),
              child: Text(
                "loc.forgotPasswordSupport",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
