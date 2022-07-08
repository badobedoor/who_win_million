// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:who_win_million/constants/my_colors.dart';

import 'containerWithLinearGradient.dart';

class LinearButton extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Function ontap;
  final double? borderRadius;

  const LinearButton({
    Key? key,
    required this.width,
    required this.height,
    required this.child,
    required this.ontap,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: LinearContainer(
          width: width,
          height: height,
          borderRadius: borderRadius,
          child: child),
    );
  }
}
