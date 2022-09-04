import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:who_win_million/constants/my_colors.dart';
import 'package:who_win_million/presentation/widgets/NormalText.dart';
import 'package:who_win_million/presentation/widgets/containerWithLinearGradient.dart';
import 'package:who_win_million/presentation/widgets/linear_button.dart';

import '../../business_logic/provider/variablesProvider.dart';

class QuitTheGame extends StatelessWidget {
  const QuitTheGame({
    Key? key,
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
          InkWell(
            onTap: () => Provider.of<VariablesProvider>(context, listen: false)
                .set_quitGameAlertShow(false),
            child: Padding(
              padding: EdgeInsets.only(top: 16.sp, left: 16.sp),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  FontAwesomeIcons.xmark,
                  color: MyColors.yellow,
                  size: 19.sp,
                ),
              ),
            ),
          ),
          15.verticalSpace,
          NormalText(
            text: "هل تريد الإنسحاب حقا ؟",
            color: MyColors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w900,
          ),
          23.verticalSpace,
          LinearButton(
            ontap: () {
              Provider.of<VariablesProvider>(context, listen: false)
                  .set_quitGameAlertShow(false);
              Provider.of<VariablesProvider>(context, listen: false)
                  .set_endGameAlertShow(true);
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
          )
        ]),
      ),
    );
  }
}
