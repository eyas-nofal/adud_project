import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:adud_project/l10n/app_localizations.dart';

class LocationPicker extends StatelessWidget {
  final String? selectedLocation;
  final VoidCallback onTap;

  const LocationPicker({
    super.key,
    required this.selectedLocation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          loc.locationLabel,
          style: TextStyle(
            fontSize: 14.sp,
            color: const Color(0xFF4A5568),
          ),
        ),
        SizedBox(height: 8.h),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Row(
              children: [
                Icon(Icons.location_on_outlined, color: const Color(0xFF4A5568), size: 20.sp),
                SizedBox(width: 12.w),
                Expanded(
                  child: Text(
                    selectedLocation ?? loc.selectLocation,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: selectedLocation != null ? const Color(0xFF2D3748) : const Color(0xFFA0AEC0),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(Icons.chevron_right, color: const Color(0xFFA0AEC0), size: 20.sp),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
