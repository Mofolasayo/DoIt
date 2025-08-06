import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveSizedBox extends StatelessWidget {
  final double? height;
  final double? width;
  final double? size;
  final Widget? child;

  const ResponsiveSizedBox({
    super.key,
    this.height,
    this.width,
    this.size,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (size ?? height)?.sp,
      width: (size ?? width)?.sp,
      child: child,
    );
  }
}
