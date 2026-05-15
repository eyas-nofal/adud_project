import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLoader extends StatelessWidget {
  final double size;
  final Color color;

  const AppLoader({
    super.key, 
    this.size = 50.0, 
    this.color = Colors.blue, 
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitDualRing(
        color: color,
        size: size.w,
        lineWidth: 3.0, 
      ),
    );
  }
}