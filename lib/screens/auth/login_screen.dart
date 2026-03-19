import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/screens/auth/create_new_account.dart';
import 'package:adud_project/screens/auth/register_screen.dart';
import 'package:adud_project/screens/core/constants/app_colors.dart';
import 'package:adud_project/screens/core/widgets/custom_button.dart';
import 'package:adud_project/screens/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              SizedBox(height: 65.h),
              Center(
                child: Column(
                  children: [
                    Text(
                      AppLocalizations.of(context)!.login,
                      style: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      AppLocalizations.of(context)!.welcomeBack,
                      style: TextStyle(fontSize: 15.sp, color: Colors.black),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 60),
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
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(AppLocalizations.of(context)!.forgotPassword),
                  ),
                ],
              ),
              CustomButton(
                width: double.infinity,
                height: 50.h,
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                text: AppLocalizations.of(context)!.login,
                onPressed: () {},
              ),
              SizedBox(height: 15.h),
              SizedBox(
                height: 50.h,
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 0.6.h, color: Colors.black),
                    ),
                    Text(AppLocalizations.of(context)!.or),
                    Expanded(
                      child: Divider(thickness: 0.6.h, color: Colors.black),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 200.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.dontHaveAccount),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CreateNewAccount(),
                        ),
                      );
                    },
                    child: Text(AppLocalizations.of(context)!.createNewAccount),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
