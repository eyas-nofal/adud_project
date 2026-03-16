import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.cairo(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
    ;
  }
}


/*
CustomButton(
  width: 370,
  height: 105,
  backgroundColor: Colors.white,
  textColor: Colors.black,
  text: "Omar Dandis",
  onPressed: () {
  },
),
*/