import 'package:adud_project/l10n/app_localizations.dart';
import 'package:adud_project/screens/core/constants/app_colors.dart';
import 'package:adud_project/screens/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewAccount extends StatelessWidget {
  const CreateNewAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary100,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                AppLocalizations.of(context)!.createAccount,
                style: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                AppLocalizations.of(context)!.joinUsStartJourney,
                style: TextStyle(fontSize: 20.sp, color: Colors.black),
              ),
              SizedBox(height: 40.h),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  AppLocalizations.of(context)!.firstName,
                  style: TextStyle(fontSize: 20.sp, color: Colors.black),
                ),
              ),
              SizedBox(height: 10.h,),
              TextFormField(
                decoration: AppInputStyles.decorationForTextField(
                  hintText: "احمد"
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
