// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/my_colors.dart';

class ContainerWithLinearGradient extends StatelessWidget {
  final double width;
  final double height;
  final double border;
  final double borderRadius;
  final Widget child;

  const ContainerWithLinearGradient({
    Key? key,
    required this.width,
    required this.height,
    required this.border,
    required this.borderRadius,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearContainer(
      width: width, //311,
      height: height, // 161,
      borderRadius: borderRadius.r,
      child: Container(
          alignment: Alignment.center,
          width: (width - border).w,
          height: (height - border).h,
          decoration: BoxDecoration(
            color: MyColors.green,
            borderRadius: BorderRadius.circular(borderRadius.r),
            boxShadow: [
              BoxShadow(
                color: MyColors.black.withOpacity(0.25),
                spreadRadius: 5,
                blurRadius: 4,
                offset: Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: child),
    );
  }
}

class LinearContainer extends StatelessWidget {
  const LinearContainer({
    Key? key,
    required this.width,
    required this.height,
    this.borderRadius,
    required this.child,
    this.color,
  }) : super(key: key);

  final double width;
  final double height;
  final double? borderRadius;
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.w,
      height: height.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              color ?? MyColors.yellow,
              color ?? MyColors.orang,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.001, 1],
            tileMode: TileMode.clamp),
        borderRadius: BorderRadius.circular(borderRadius ?? 6.r),
      ),
      child: child,
    );
  }
}
