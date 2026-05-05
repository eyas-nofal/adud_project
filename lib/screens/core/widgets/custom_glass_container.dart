import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGlassContainer extends StatefulWidget {
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
  State<CustomGlassContainer> createState() => _CustomGlassContainerState();
}

class _CustomGlassContainerState extends State<CustomGlassContainer> {
  double _scale = 1.0; // الحجم الطبيعي

  void _onTapDown(TapDownDetails details) {
    setState(() => _scale = 0.92); // يصغر بنسبة 8% عند اللمس
    HapticFeedback.lightImpact(); // هزة خفيفة جداً بتعطي إحساس فخم
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _scale = 1.0); // يرجع لحجمه الطبيعي عند رفع اليد
  }

  void _onTapCancel() {
    setState(() => _scale = 1.0); // يرجع لحجمه لو المستخدم سحب إيده لبره
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTab,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      behavior: HitTestBehavior.opaque,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: widget.blur, sigmaY: widget.blur),
            child: Container(
              width: widget.size.w,
              height: widget.size.h,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(widget.borderRadius.r),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                  width: 1,
                ),
              ),
              child: Center(child: widget.child),
            ),
          ),
        ),
      ),
    );
  }
}
