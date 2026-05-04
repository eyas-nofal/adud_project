import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGlassContainer extends StatelessWidget {
  final Widget child;
  final double size;
  final double borderRadius;
  final double blur;
  final VoidCallback? onTab;

  const CustomGlassContainer({
    super.key,
    required this.child,
    this.size = 100.0,
    this.borderRadius = 28.0,
    this.blur = 10.0,
    this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onTab
    ,behavior: HitTestBehavior.opaque,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius.r),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: Container(
        width: size.w,
        height: size.h,
      decoration: BoxDecoration(
        color : Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(borderRadius.r),
        border: Border.all(
          color : Colors.white.withValues(alpha: 0.2),
          width: 1
        )
      ),
      child: Center(
        child:child
      ),
      ),

      
      ),
    ),
    );



  }
}
