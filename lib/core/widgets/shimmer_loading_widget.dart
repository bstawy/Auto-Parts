import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingWidget extends StatelessWidget {
  final Color? baseColor, highlightColor, containerColor;
  final double? width, height, borderRadius;

  const ShimmerLoadingWidget({
    super.key,
    this.baseColor,
    this.highlightColor,
    this.containerColor,
    this.width,
    this.height,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? Colors.grey[300]!,
      highlightColor: highlightColor ?? Colors.white,
      child: Container(
        height: height ?? 25.h,
        width: width ?? 135.w,
        decoration: BoxDecoration(
          color: containerColor ?? Colors.white,
          borderRadius: BorderRadius.circular(borderRadius ?? 17.r),
        ),
      ),
    );
  }
}