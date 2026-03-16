import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
class ChooseLanguageScreen extends StatelessWidget {
  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 255, 255),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "عضُد",
                style: TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 20),
              Text(
                " أختر لغتك | choose your language",
                style: TextStyle(fontSize: 15.sp,)
              ),
              SizedBox(height: 60),
              SizedBox(
                width: 370,
                height: 110,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "العربية",
                        style: TextStyle(fontSize: 27.sp, fontWeight: FontWeight.bold)
                      ),
                      SizedBox(height: 4),
                      Text(
                        "اللغة الأساسية",
                        style: TextStyle(fontSize: 15.sp,color: Colors.black87)
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 370,
                height: 110,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: Column(
                    children: [
                      Text(
                        "English",
                        style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold)
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Application language",
                        style: TextStyle(fontSize: 15.sp, color: Colors.black87)
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 24),
              Text(
                "يمكنك تغيير اللغة لاحقاً من الإعدادات",
                style: TextStyle(fontSize: 13.sp, color: Colors.black87)
              ),
              Text(
                "You can change the language later in settings",
                style: TextStyle(fontSize: 13.sp, color: Colors.black87)
              ),
            ],
          ),
        ),
      ),
    );
  }
}
