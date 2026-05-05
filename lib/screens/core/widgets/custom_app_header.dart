// هذا الهيكل العام للـ Widget بدون الكود الكامل
import 'package:adud_project/screens/core/widgets/custom_glass_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final int notifications;
  final int messages;

  const CustomAppHeader({
    super.key,
    required this.title,
    required this.subTitle,
    this.notifications = 0,
    this.messages = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 20,
        left: 20,
        right: 20,
        bottom: 30,
      ),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomGlassContainer(
                    size: 50,
                    borderRadius: 15.r,
                    child: Icon(Icons.notifications, color: Colors.white),
                  ),

                  if (notifications > 0)
                    Positioned(
                      top: -5,
                      right: -5,
                      child: _buildNotificationBadge(notifications),
                    ),
                ],
              ),
              SizedBox(width: 13.w),

              Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomGlassContainer(
                    size: 50,
                    borderRadius: 15.r,
                    child: Icon(Icons.chat_sharp, color: Colors.white),
                  ),
                  if (messages > 0)
                    Positioned(
                      top: -5,
                      right: -5,
                      child: _buildNotificationBadge(messages),
                    ),
                ],
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(color: Colors.white70, fontSize: 16.sp),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationBadge(int count) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue, width: 3),
      ),
      constraints: BoxConstraints(minWidth: 18, minHeight: 18),
      child: Text(
        '$count',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp, 
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
