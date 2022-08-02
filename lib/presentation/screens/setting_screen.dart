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

import '../../business_logic/help/sharedPreferences.dart';
import '../../data/models/player.dart';
import '../widgets/loginSettingsContainer.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
  // note: updated as context.ancestorStateOfType is now deprecated
  static _SettingScreenState? of(BuildContext context) =>
      context.findAncestorStateOfType<_SettingScreenState>();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isAccountSettingShow = false;
  bool isloginSettingShow = false;
  bool isSoundOn = true; //هنا الاصول اجبيب البينات من الداتا المسجله على الجهاز
  var id = PlayerAccount.playerId;
  var playerEmail = PlayerAccount.playerEmail;
  set settingShow(bool value) => setState(() => isAccountSettingShow = value);

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
                      playerEmail != null ? 'إعدادات الحساب' : 'تسجيل الدخول',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: MyColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ontap: () {
                      setState(() {
                        playerEmail != null
                            ? isAccountSettingShow = true
                            : isloginSettingShow = true;
                      });
                    },
                  ),
                  19.verticalSpace, // SizedBox(height: 20.h),
                  LinearButton(
                    width: 200,
                    height: 35,
                    ontap: () async {
                      setState(() {
                        isSoundOn = !isSoundOn;
                      });
                      await NewSharedPreferences().setIsSoundOn(isSoundOn);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          isSoundOn
                              ? FontAwesomeIcons.volumeXmark
                              : FontAwesomeIcons.volumeHigh,
                          color: MyColors.black,
                          size: 14.sp,
                        ),
                        15.horizontalSpace,
                        Text(
                          isSoundOn ? 'ايقاف الصوت' : 'تشغيل الصوت',
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
                      ontap: () {
                        //تقيم التطبيق
                      }),
                  40.verticalSpace,
                  InkWell(
                    onTap: () => Navigator.pop(context),
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
        // خللفية شفافة سوداء
        //   bool isAccountSettingShow = false;
        // bool isloginSettingShow = false;
        if (isAccountSettingShow == true || isloginSettingShow == true)
          InkWell(
              onTap: () {
                setState(() {
                  isAccountSettingShow = false;
                  isloginSettingShow = false;
                });
              },
              child: BlackScreenWithOpacity()),

        // إعدادات الحساب
        //account settings Container
        if (isAccountSettingShow == true) AccountSettingsContainer(),
        //login settings Container
        if (isloginSettingShow == true) const LoginSettingsContainer(),
      ]),
    );
  }
}
