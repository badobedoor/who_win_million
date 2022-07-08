import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWithLogoBackgroundImage extends StatelessWidget {
  final Widget child;
  ContainerWithLogoBackgroundImage({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // 640×360 px
        height: 360.h,
        width: 640.w,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bgLogo.png"), fit: BoxFit.fill),
        ),
        child: child);
  }
}
