import 'package:flutter/material.dart';
import 'package:who_win_million/constants/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:who_win_million/constants/strings.dart';
import 'package:who_win_million/presentation/widgets/container_with_logo_background_image.dart';

import '../../business_logic/help/sharedPreferences.dart';

class OnboardigScreen extends StatelessWidget {
  const OnboardigScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ContainerWithLogoBackgroundImage(
      pageName: '',
      child: Padding(
        padding: EdgeInsets.only(right: 47.w, top: 135.h),
        child: Container(
          // color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                alignment: Alignment.topRight,
                width: 262.w,
                height: 75.h,
                child: Text(
                  'اختبر معلوماتك الدينية و كن من المتصدرين في قائمة المتسابقين',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 16.sp,
                    height: 2.0,
                    color: MyColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 98.h),
              InkWell(
                onTap: () {
                  NewSharedPreferences().setIsOnboardingScreenShowed(true);
                  // startscreen = 'next';
                  Navigator.pushNamed(context, logInScreen);
                },
                child: Text(
                  'التالى',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: MyColors.yellow,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
