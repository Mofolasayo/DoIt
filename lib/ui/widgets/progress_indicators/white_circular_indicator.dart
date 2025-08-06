import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final Color? color;
  final double? radius;
  final double? value;

  const CustomCircularProgressIndicator(
      {Key? key, this.color, this.radius, this.value})
      : super(key: key);

  Color get _color => color ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Platform.isIOS && value == null
          ? CupertinoActivityIndicator(color: _color, radius: radius ?? 15)
          : CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation(_color),
              value: value,
            ),
    );
  }
}
