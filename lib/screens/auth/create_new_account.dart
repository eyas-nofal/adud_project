import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/screens/auth/login_screen.dart';
import 'package:adud_project/screens/core/constants/app_colors.dart';
import 'package:adud_project/screens/core/widgets/custom_button.dart';
import 'package:adud_project/screens/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({super.key});

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  bool _isAgreed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary100,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50.h),

              Center(
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.createAccount,
                      style: TextStyle(
                        fontSize: 35.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      AppLocalizations.of(context)!.joinUsStartJourney,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.sp, color: Colors.black),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 40.h),

              Text(
                AppLocalizations.of(context)!.firstName,
                style: TextStyle(fontSize: 18.sp, color: Colors.black),
              ),
              SizedBox(height: 10.h),
              TextFormField(
                decoration: AppInputStyles.decorationForTextField(
                  hintText: "أحمد",
                  prefixIcon: Icons.person_2_outlined,
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                AppLocalizations.of(context)!.email,
                style: TextStyle(fontSize: 18.sp, color: Colors.black),
              ),
              SizedBox(height: 10.h),
              TextFormField(
                decoration: AppInputStyles.decorationForTextField(
                  hintText: "example@gmail.com",
                  prefixIcon: Icons.email_outlined,
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                AppLocalizations.of(context)!.password,
                style: TextStyle(fontSize: 18.sp, color: Colors.black),
              ),
              SizedBox(height: 10.h),
              TextFormField(
                obscureText: true,
                decoration: AppInputStyles.decorationForTextField(
                  hintText: "*********",
                  prefixIcon: Icons.lock,
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),

              SizedBox(height: 20.h),

              Text(
                AppLocalizations.of(context)!.confirmPassword,
                style: TextStyle(fontSize: 18.sp, color: Colors.black),
              ),
              SizedBox(height: 10.h),
              TextFormField(
                obscureText: true,
                decoration: AppInputStyles.decorationForTextField(
                  hintText: "*********",
                  prefixIcon: Icons.lock,
                  suffixIcon: Icon(Icons.visibility),
                ),
              ),

              SizedBox(height: 20.h),

              Row(
                children: [
                  Checkbox(
                    value: _isAgreed,
                    onChanged: (val) => setState(() => _isAgreed = val!),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        AppLocalizations.of(context)!.agreeToTerms,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30.h),

              CustomButton(
                width: double.infinity,
                height: 50.h,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                text: AppLocalizations.of(context)!.createAccount,
                onPressed: () {},
              ),

              SizedBox(height: 20.h),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    AppLocalizations.of(context)!.alreadyHaveAccount,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
