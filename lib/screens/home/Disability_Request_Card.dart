import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DisabilityRequestCard extends StatelessWidget {
  final String name;
  final String category;
  final String distance;
  final String time;
  final String duration;
  final double? price;
  final VoidCallback onAccept;

  const DisabilityRequestCard({
    super.key,
    required this.name,
    required this.category,
    required this.distance,
    required this.time,
    required this.duration,
    this.price,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: Directionality.of(context),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10.r,
              spreadRadius: 2.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFF8A73FF), Color(0xFFB5A6FF)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      name.isNotEmpty ? name[0] : '',
                      style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.cairo(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF333333),
                        ),
                      ),
                      Text(
                        category,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.cairo(
                          fontSize: 13.sp,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                if (price != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5F9ED),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '$price د.أ',
                          style: GoogleFonts.cairo(
                            color: const Color(0xFF00C97B),
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        const Icon(
                          Icons.attach_money,
                          color: Color(0xFF00C97B),
                          size: 16,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildInfoItem(Icons.location_on_outlined, distance),
                SizedBox(width: 16.w),
                _buildInfoItem(Icons.access_time, time),
                SizedBox(width: 16.w),
                Text(
                  'المدة: $duration',
                  style: GoogleFonts.cairo(
                    color: Colors.grey.shade600,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: const LinearGradient(
                  colors: [Color(0xFF00D28E), Color(0xFF2E8CFF)],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                onPressed: onAccept,
                child: Text(
                  'قبول الطلب',
                  style: GoogleFonts.cairo(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16.sp, color: Colors.grey.shade600),
        SizedBox(width: 4.w),
        Text(
          text,
          style: GoogleFonts.cairo(
            color: Colors.grey.shade600,
            fontSize: 13.sp,
          ),
        ),
      ],
    );
  }
}