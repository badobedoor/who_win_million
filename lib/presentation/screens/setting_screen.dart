import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:who_win_million/constants/my_colors.dart';
import 'package:who_win_million/constants/strings.dart';
import 'package:who_win_million/presentation/screens/questions_screen.dart';
import 'package:who_win_million/presentation/widgets/accountSettingsContainer.dart';
import 'package:who_win_million/presentation/widgets/blackScreenWithOpacity.dart';
import 'package:who_win_million/presentation/widgets/linear_button.dart';
import 'package:who_win_million/presentation/widgets/container_with_logo_background_image.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ContainerWithLogoBackgroundImage(
          child: Padding(
            padding: EdgeInsets.only(right: 47.w, top: 85.h),
            child: Container(
              // color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'الإعدادات ',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 19.sp,
                        color: MyColors.white,
                        fontWeight: FontWeight.w800),
                  ),
                  15.verticalSpace,
                  LinearButton(
                    width: 200,
                    height: 35,
                    child: Text(
                      'تسجيل الدخول', //'إعدادات الحساب',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: MyColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ontap: () => Navigator.pushNamed(context, questionsScreen),
                  ),
                  19.verticalSpace, // SizedBox(height: 20.h),
                  LinearButton(
                    width: 200,
                    height: 35,
                    ontap: () =>
                        Navigator.pushNamed(context, leaderBoardScreen),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          // FontAwesomeIcons.volumeHigh,
                          FontAwesomeIcons.volumeXmark,
                          color: MyColors.black,
                          size: 14.sp,
                        ),
                        15.horizontalSpace,
                        Text(
                          'تشغيل الصوت',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: MyColors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  19.verticalSpace, // SizedBox(height: 20.h),
                  LinearButton(
                      width: 200,
                      height: 35,
                      child: Text(
                        'تقيم التطبيق',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: MyColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ontap: () {}),
                  40.verticalSpace,
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    // Navigator.pushNamed(context, homeScreen),
                    child: Text(
                      'رجوع',
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
        ),
        //  خللفية شفافة سوداء
        //   BlackScreenWithOpacity(),

        //إعدادات الحساب
        //account settings Container

        // AccountSettingsContainer(),
      ]),
    );
  }
}
