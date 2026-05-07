import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:adud_project/screens/core/widgets/custom_glass_container.dart';

class CustomAppHeader extends StatelessWidget {
  final String title;
  final String subTitle;
  final int notifications;
  final int messages;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onChatTap;

  const CustomAppHeader({
    super.key,
    required this.title,
    required this.subTitle,
    this.notifications = 0,
    this.messages = 0,
    this.onNotificationTap,
    this.onChatTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        20.w,
        MediaQuery.of(context).padding.top + 20.h,
        20.w,
        30.h,
      ),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTextSection(),
          Row(
            children: [
              _buildIconButton(
                Icons.notifications,
                notifications,
                onNotificationTap,
              ),
              SizedBox(width: 13.w),
              _buildIconButton(Icons.chat_sharp, messages, onChatTap),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextSection() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment
          .start, 
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
    );
  }

  Widget _buildIconButton(IconData icon, int count, VoidCallback? onTap) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CustomGlassContainer(
          onTab: onTap,
          size: 50,
          borderRadius: 15.r,
          child: Icon(icon, color: Colors.white),
        ),
        if (count > 0)
          PositionedDirectional(
            top: -5,
            end: -5, // 'end' تغنيك عن حساب isRtl
            child: _buildBadge(count),
          ),
      ],
    );
  }

  Widget _buildBadge(int count) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.blue, width: 2),
      ),
      constraints: const BoxConstraints(minWidth: 20, minHeight: 20),
      child: Center(
        child: Text(
          '$count',
          style: TextStyle(
            color: Colors.white,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
