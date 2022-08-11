// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:who_win_million/constants/my_colors.dart';
import 'package:who_win_million/presentation/widgets/NormalText.dart';
import 'package:who_win_million/presentation/widgets/containerWithLinearGradient.dart';
import 'package:who_win_million/presentation/widgets/linear_button.dart';

import '../../business_logic/help/soundEffects.dart';
import '../../constants/strings.dart';
import '../screens/questions_screen.dart';

class EndGameAlert extends StatelessWidget {
  String scoreText;
  EndGameAlert({
    Key? key,
    required this.scoreText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ContainerWithLinearGradient(
        width: 311,
        height: 166,
        border: 1,
        borderRadius: 13,
        child: Column(children: [
          20.verticalSpace,
          RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: 'تهانينا لقد حصلت على ',
                  style: TextStyle(
                    color: MyColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 16.sp,
                  )),
              TextSpan(
                  text: scoreText,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16.sp,
                      color: MyColors.darkGreen)),
              TextSpan(
                  text: ' نقطة',
                  style: TextStyle(
                      color: MyColors.white,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w900)),
            ]),
          ),
          10.verticalSpace,
          NormalText(
            text: "هل تريد إعادة المحاولة ؟",
            color: MyColors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w900,
          ),
          25.verticalSpace,
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LinearButton(
                ontap: () async {
                  QuestionsScreen.of(context)!.endGameAlertShow = false;
                  Navigator.pop(context);
                  SoundEffects.setAndPlaystartgameAudio().whenComplete(
                      () => SoundEffects.setAndPlayQuestionsEseyAudio());

                  Navigator.pushNamed(context, questionsScreen);
                },
                width: 103,
                height: 40,
                borderRadius: 10,
                child: NormalText(
                  text: "نعم",
                  color: MyColors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
              10.horizontalSpace,
              LinearButton(
                ontap: () {
                  QuestionsScreen.of(context)!.endGameAlertShow = false;

                  Navigator.pop(context);
                  SoundEffects.setAndPlayOpeningAudio();
                },
                width: 103,
                height: 40,
                borderRadius: 10,
                child: NormalText(
                  text: "لا",
                  color: MyColors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
