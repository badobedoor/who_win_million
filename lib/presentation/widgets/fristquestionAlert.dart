import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:who_win_million/presentation/widgets/NormalText.dart';

import '../../business_logic/provider/variablesProvider.dart';
import '../../constants/my_colors.dart';
import 'containerWithLinearGradient.dart';
import 'linear_button.dart';

class FristquestionAlert extends StatelessWidget {
  const FristquestionAlert({
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
        height: 151,
        border: 1,
        borderRadius: 13,
        child: Column(children: [
          25.verticalSpace,
          SizedBox(
            width: 270,
            child: NormalText(
              text: "لا يمكن أستخدام وسائل المساعدة فى اول سؤال",
              color: MyColors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
          30.verticalSpace,
          LinearButton(
            ontap: () {
              Provider.of<VariablesProvider>(context, listen: false)
                  .set_FristquestionAlertShow(false);
            },
            width: 103,
            height: 40,
            borderRadius: 10,
            child: NormalText(
              text: "حسنا",
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
