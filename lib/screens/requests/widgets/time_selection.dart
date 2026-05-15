import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:adud_project/l10n/app_localizations.dart';

class TimeSelection extends StatelessWidget {
  final bool isNowSelected;
  final ValueChanged<bool> onTimeTypeChanged;
  final String selectedDuration;
  final ValueChanged<String?> onDurationChanged;
  final String? selectedDate;
  final VoidCallback onDateTap;
  final String? selectedTime;
  final VoidCallback onTimeTap;

  const TimeSelection({
    super.key,
    required this.isNowSelected,
    required this.onTimeTypeChanged,
    required this.selectedDuration,
    required this.onDurationChanged,
    required this.selectedDate,
    required this.onDateTap,
    required this.selectedTime,
    required this.onTimeTap,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final durations = [loc.oneHour, loc.twoHours, loc.threeHours];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          loc.requestHelp,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2D3748),
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildTimeOption(
                context: context,
                title: loc.requestNow,
                icon: Icons.access_time,
                iconColor: Colors.green,
                isSelected: isNowSelected,
                onTap: () => onTimeTypeChanged(true),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildTimeOption(
                context: context,
                title: loc.requestLater,
                icon: Icons.calendar_today_outlined,
                iconColor: const Color(0xFF4A5568),
                isSelected: !isNowSelected,
                onTap: () => onTimeTypeChanged(false),
              ),
            ),
          ],
        ),
        if (!isNowSelected) ...[
          SizedBox(height: 20.h),
          _buildPickerField(
            title: loc.selectDate,
            value: selectedDate,
            placeholder: "mm/dd/yyyy",
            onTap: onDateTap,
          ),
          SizedBox(height: 16.h),
          _buildPickerField(
            title: loc.selectTime,
            value: selectedTime,
            placeholder: "--:-- --",
            onTap: onTimeTap,
          ),
        ],
        SizedBox(height: 20.h),
        Text(
          loc.expectedDuration,
          style: TextStyle(
            fontSize: 14.sp,
            color: const Color(0xFF4A5568),
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: const Color(0xFFE2E8F0)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: selectedDuration,
              icon: const Icon(Icons.keyboard_arrow_down, color: Color(0xFF4A5568)),
              items: durations.map((String duration) {
                return DropdownMenuItem<String>(
                  value: duration,
                  child: Text(
                    duration,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFF2D3748),
                    ),
                  ),
                );
              }).toList(),
              onChanged: onDurationChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTimeOption({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color iconColor,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withValues(alpha: 0.05) : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? Colors.blue : const Color(0xFFE2E8F0),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 20.sp),
            SizedBox(width: 8.w),
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected ? Colors.blue : const Color(0xFF2D3748),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPickerField({
    required String title,
    required String? value,
    required String placeholder,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14.sp,
            color: const Color(0xFF4A5568),
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Text(
              value ?? placeholder,
              style: TextStyle(
                fontSize: 14.sp,
                color: value != null ? const Color(0xFF2D3748) : const Color(0xFFA0AEC0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
