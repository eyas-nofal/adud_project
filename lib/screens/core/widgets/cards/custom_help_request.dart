import 'package:adud_project/models/help_request_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpCardWidget extends StatelessWidget {
  final HelpRequestModel request;

  const HelpCardWidget({super.key, required this.request});

  @override
  Widget build(BuildContext context) {
    bool isActive = request.status == HelpStatus.active;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: isActive
            ? Border.all(color: const Color(0xFF2ED573), width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              _buildLeadingIcon(), // الأيقونة الدائرية هنا
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      request.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    _buildUserInfo(),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          _buildTimeInfo(),
          SizedBox(height: 15.h),
          _buildActionButtons(isActive),
        ],
      ),
    );
  }

  Widget _buildLeadingIcon() {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Color(request.themeColor),
        shape: BoxShape.circle,
      ),
      child: Icon(request.icon, color: Colors.white, size: 24.sp),
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        CircleAvatar(
          radius: 10.r,
          backgroundColor: Colors.green.shade100,
          child: Text(
            request.userName.isNotEmpty ? request.userName[0] : "?",
            style: TextStyle(fontSize: 10.sp, color: Colors.green),
          ),
        ),
        SizedBox(width: 6.w),
        Text(
          request.userName,
          style: TextStyle(color: Colors.grey, fontSize: 13.sp),
        ),
      ],
    );
  }

  Widget _buildActionButtons(bool isActive) {
    return Row(
      children: [
        if (!isActive) ...[
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: StadiumBorder(),
                elevation: 0,
              ),
              child: Text(
                "عرض التفاصيل",
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
              ),
            ),
          ),
          SizedBox(width: 10.w),
          TextButton(
            onPressed: () {},
            child: Text("إلغاء", style: TextStyle(color: Colors.red)),
          ),
        ] else ...[
          Expanded(child: _buildIconButton(Icons.call, "اتصال", Colors.blue)),
          SizedBox(width: 10.w),
          Expanded(
            child: _buildIconButton(
              Icons.info_outline,
              "التفاصيل",
              Colors.blue,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildIconButton(IconData icon, String label, Color color) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.white, size: 18.sp),
      label: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 14.sp),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 0,
      ),
    );
  }

  Widget _buildTimeInfo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          request.duration,
          style: TextStyle(fontSize: 11.sp, color: Colors.grey),
        ),
        SizedBox(width: 4.w),
        Icon(Icons.calendar_today, size: 12.sp, color: Colors.grey),
        SizedBox(width: 15.w),
        Text(
          request.timeInfo,
          style: TextStyle(fontSize: 11.sp, color: Colors.grey),
        ),
        SizedBox(width: 4.w),
        Icon(Icons.access_time, size: 12.sp, color: Colors.grey),
      ],
    );
  }
}