import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ResponsiveSvg extends StatelessWidget {
  final String path;
  final double? size;
  final double? height;
  final double? width;
  final Color? color;
  final VoidCallback? onTap;
  ResponsiveSvg(this.path,
      {super.key, this.size, this.color, this.height, this.width, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        "assets/icons/$path.svg",
        height: height?.sp ?? size?.sp,
        width: width?.sp ?? size?.sp,
        colorFilter:
            color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn),
      ),
    );
  }
}
