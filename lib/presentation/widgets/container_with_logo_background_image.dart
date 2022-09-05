import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'playLogoAnimation.dart';

class ContainerWithLogoBackgroundImage extends StatelessWidget {
  final Widget child;
  final String pageName;
  ContainerWithLogoBackgroundImage({
    Key? key,
    required this.child,
    required this.pageName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            // 640×360 px
            height: 360.h,
            width: 640.w,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: pageName == 'homeScreen'
                      ? AssetImage("assets/images/bgAsset.png")
                      : AssetImage("assets/images/bgLogo.png"),
                  fit: BoxFit.fill),
            ),
            child: child),
        if (pageName == 'homeScreen')
          Positioned(top: 14.h, left: 14.h, child: PlayLogoAnimation()),

        //  Container(
        // // 640×360 px
        // height: 360.h,
        // width: 640.w,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage("assets/images/bgAsset.png"), fit: BoxFit.fill),
        // ),
        // child: child),
      ],
    );
  }
}
