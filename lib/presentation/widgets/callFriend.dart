import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../business_logic/help/soundEffects.dart';
import '../../business_logic/provider/variablesProvider.dart';
import '../../constants/my_colors.dart';
import 'NormalText.dart';
import 'containerWithLinearGradient.dart';
import 'linear_button.dart';

class CallFriend extends StatelessWidget {
  const CallFriend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var correctAnswer =
        Provider.of<VariablesProvider>(context, listen: true).correctAnswer;
    return Container(
      alignment: Alignment.center,
      child: ContainerWithLinearGradient(
        width: 311,
        height: 191,
        border: 1,
        borderRadius: 13,
        child: Column(children: [
          Padding(
            padding: EdgeInsets.only(top: 16.sp),
            child: Icon(
              FontAwesomeIcons.phoneFlip,
              color: MyColors.white,
              size: 19.sp,
            ),
          ),
          20.verticalSpace,
          SizedBox(
            width: 220,
            child: NormalText(
              text: "أعتقد أن الإجابة الصحيحة",
              color: MyColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          10.verticalSpace,
          SizedBox(
            width: 220,
            child: NormalText(
              text: " هي الإجابة رقم $correctAnswer",
              color: MyColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          20.verticalSpace,
          LinearButton(
            ontap: () {
              if (SoundEffects.phoneFriendClockAudio.playing)
                SoundEffects.phoneFriendClockAudioDispose();
              Provider.of<VariablesProvider>(context, listen: false)
                  .set_CallFriendContainerShow(false);
            },
            width: 103,
            height: 40,
            borderRadius: 10,
            child: NormalText(
              text: "تم",
              color: MyColors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w900,
            ),
          )
        ]),
      ),
    );
  }
}
