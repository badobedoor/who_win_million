// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:who_win_million/constants/my_colors.dart';
import 'package:who_win_million/presentation/widgets/container_with_background_image.dart';
import 'package:who_win_million/presentation/widgets/leaderBordListViewItem.dart';

import '../widgets/containerWithLinearGradient.dart';

class LeaderBordScreen extends StatelessWidget {
  const LeaderBordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContainerWithBackgroundImage(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 53.h),
                child: Column(
                  children: [
                    //heder
                    LinearContainer(
                      width: 475,
                      height: 50,
                      borderRadius: 11.r,
                      child: Container(
                        alignment: Alignment.center,
                        width: 472.w,
                        height: 47.h,
                        decoration: BoxDecoration(
                          color: MyColors.green,
                          borderRadius: BorderRadius.circular(11.r),
                          boxShadow: [
                            BoxShadow(
                              color: MyColors.black.withOpacity(0.25),
                              spreadRadius: 5,
                              blurRadius: 4,
                              offset:
                                  Offset(0, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Text(
                          'ترتيب المتسابقين',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: MyColors.white,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                    //خلفيه سوداء شفافه
                    Container(
                      width: 386.w,
                      height: 255.h,
                      color: MyColors.black.withOpacity(0.60),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //LeaderBordListViewItem
                            ListViewItem(),
                            Container(
                                color: MyColors.green,
                                child:
                                    //LeaderBordListViewItem
                                    ListViewItem(
                                  color: MyColors.darkGreen,
                                )),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 31.h,
              right: 47.h,
              child: InkWell(
                //هل هنا هيكون تسجيل خروج ام الخروج من اللعبه وتصحيح العبارة اذا كانت تسجيل خروج
                onTap: () => Navigator.pop(context),
                child: Text(
                  'رجوع',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: MyColors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
//LeaderBordListViewItem
