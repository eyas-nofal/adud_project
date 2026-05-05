// Import the app's custom colors
import 'package:adud_project/screens/core/constants/app_colors.dart';
// Import Flutter's core UI toolkit (Material Design)
import 'package:flutter/material.dart';
// Import flutter_screenutil for responsive sizing (scales UI elements based on screen size)
import 'package:flutter_screenutil/flutter_screenutil.dart';
// Import Google Fonts (using Cairo font here)
import 'package:google_fonts/google_fonts.dart';

// A stateless widget representing a static card that doesn't change its own state
class DisabilityRequestCard extends StatelessWidget {
  // --- Properties (Data held by this card) ---
  final String name;      // The person's name
  final String category;  // Request category
  final String distance;  // Distance
  final String time;      // Time
  final String duration;  // Duration
  final double? price;    // Price (The '?' means it can be null if the request is free)
  final VoidCallback onAccept; // Callback function executed when the accept button is pressed

  // --- Constructor: Initializes the card with the required data ---
  const DisabilityRequestCard({
    super.key,              // Unique key for the widget
    required this.name,     // 'required' means this parameter must be provided
    required this.category,
    required this.distance,
    required this.time,
    required this.duration,
    this.price,             // Optional (can be null)
    required this.onAccept,
  });

  // --- Build Method: Where the UI is drawn and widgets are composed ---
  @override
  Widget build(BuildContext context) {
    return Directionality(
      // Ensures the text direction matches the context (RTL for Arabic)
      textDirection: Directionality.of(context),
      
      // Main container representing the white card
      child: Container(
        // Outer margin (.h for responsive height, .w for responsive width)
        margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
        // Inner padding to keep content away from the edges
        padding: EdgeInsets.all(16.w),
        
        // Card decoration: white background, rounded corners, and a soft shadow
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r), // .r for responsive border radius
          boxShadow: [
            BoxShadow(
              color: AppColors.secondary200,
              blurRadius: 10.r,
              spreadRadius: 2.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        
        // Main column to stack the card's contents vertically
        child: Column(
          mainAxisSize: MainAxisSize.min, // Takes up only as much space as its children need
          children: [
            
            // -- Section 1: User Info (Arranged horizontally in a Row) --
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                // 1. Colored circle avatar containing the first letter of the name
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient( // Linear gradient background
                      colors: [AppColors.secondary600, AppColors.secondary400],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      // If name is not empty, display the first letter ([0]), else display empty string
                      name.isNotEmpty ? name[0] : '',
                      style: GoogleFonts.cairo(
                        color: Colors.white,
                        fontSize: 20.sp, // .sp for responsive font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w), // Empty space between the avatar and the text
                
                // 2. Name and Category (Expanded ensures it takes the remaining width without overflowing)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        maxLines: 1, // Maximum of 1 line
                        overflow: TextOverflow.ellipsis, // Adds (...) if the text is too long
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
                
                // 3. Price Badge: Only rendered if price is provided (not null)
                if (price != null)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5F9ED), // Light green background
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '$price د.أ',
                          style: GoogleFonts.cairo(
                            color: AppColors.success600,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        const Icon(
                          Icons.attach_money,
                          color: AppColors.success600,
                          size: 16,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            
            SizedBox(height: 20.h), // Spacing between Section 1 and Section 2
            
            // -- Section 2: Distance, Time, and Duration --
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Using the helper method below to build icon+text items
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
            
            SizedBox(height: 20.h), // Spacing before the button
            
            // -- Section 3: "Accept Request" Button --
            Container(
              width: double.infinity, // Button takes the full width of the card
              height: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: const LinearGradient( // Gradient background for the button container
                  colors: [AppColors.success400, AppColors.primary600],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // Transparent background so the container's gradient shows through
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                // Execute the accept callback when pressed
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

  // --- Helper Method ---
  // A reusable widget builder that takes an icon and text, and returns a Row containing them.
  Widget _buildInfoItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16.sp, color: Colors.grey.shade600),
        SizedBox(width: 4.w), // Spacing between the icon and the text
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