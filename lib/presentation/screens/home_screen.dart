// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:who_win_million/business_logic/help/soundEffects.dart';

import 'package:who_win_million/constants/my_colors.dart';
import 'package:who_win_million/constants/strings.dart';
import 'package:who_win_million/presentation/widgets/linear_button.dart';
import 'package:who_win_million/presentation/widgets/container_with_logo_background_image.dart';

class HomeScreen extends StatefulWidget {
  final user;

  const HomeScreen({Key? key, this.user}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SoundEffects().setAndPlayOpeningAudio();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    SoundEffects().openingAudioDispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ContainerWithLogoBackgroundImage(
      child: Padding(
        padding: EdgeInsets.only(right: 47.w, top: 108.h),
        child: Container(
          // color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              //width , height ,child,ontap
              LinearButton(
                  width: 200,
                  height: 35,
                  child: Text(
                    'إبدأ لعبة جديدة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: MyColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ontap: () async {
                    Navigator.pushNamed(context, questionsScreen);
                  }),
              20.verticalSpace, // SizedBox(height: 20.h),
              LinearButton(
                width: 200,
                height: 35,
                child: Text(
                  'ترتيب المتسابقين',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: MyColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ontap: () => Navigator.pushNamed(context, leaderBoardScreen),
              ),
              20.verticalSpace, // SizedBox(height: 20.h),
              LinearButton(
                width: 200,
                height: 35,
                child: Text(
                  'الإعدادات',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: MyColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ontap: () => Navigator.pushNamed(context, settingScreen),
              ),
              SizedBox(height: 60.h),
              InkWell(
                //هل هنا هيكون تسجيل خروج ام الخروج من اللعبه وتصحيح العبارة اذا كانت تسجيل خروج
                onTap: () => Navigator.pushNamed(context, logInScreen),
                child: Text(
                  'خروج',
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

    //   body: Container(
    //     color: Colors.black38,
    //     child: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           CircleAvatar(
    //             radius: 40,
    //             backgroundImage: NetworkImage(user.photoUrl!),
    //           ),
    //           SizedBox(height: 8),
    //           Text(
    //             'Name: ' + user.displayName!,
    //             style: TextStyle(color: Colors.white, fontSize: 20),
    //           ),
    //           SizedBox(height: 8),
    //           Text(
    //             'Email: ' + user.email!,
    //             style: TextStyle(color: Colors.white, fontSize: 20),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
