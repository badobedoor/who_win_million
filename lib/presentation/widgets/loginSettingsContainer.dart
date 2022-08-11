// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toast/toast.dart';
import 'package:who_win_million/business_logic/cubit/registration_cubit.dart';
import 'package:who_win_million/constants/my_colors.dart';
import 'package:who_win_million/presentation/screens/questions_screen.dart';
import 'package:who_win_million/presentation/widgets/NormalText.dart';
import 'package:who_win_million/presentation/widgets/containerWithLinearGradient.dart';
import 'package:who_win_million/presentation/widgets/linear_button.dart';

import '../../business_logic/help/sharedPreferences.dart';
import '../../constants/strings.dart';
import '../../data/models/player.dart';
import '../../data/web_services/registration_web_services.dart';
import '../screens/setting_screen.dart';

class LoginSettingsContainer extends StatelessWidget {
  const LoginSettingsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    var id = PlayerAccount.playerId!;

    return Container(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: ContainerWithLinearGradient(
          width: 331,
          height: 254,
          border: 1,
          borderRadius: 13,
          child: Column(children: [
            hederSection(context),
            25.verticalSpace,
            SizedBox(height: 28.h),
            googleButton(context),
            SizedBox(height: 20.h),
            facebookButton(),
          ]),
        ),
      ),
    );
  }

//heder Section badding and Title and save changes Btn
  Padding hederSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 23.h, left: 25.w, right: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.rtl,
        children: [
          // InkWell(
          //   onTap: () => saveShanges(),
          //   child: Icon(
          //     FontAwesomeIcons.check,
          //     color: MyColors.yellow,
          //     size: 19.sp,
          //   ),
          // ),
          25.horizontalSpace,
          NormalText(
            text: "تسجيل الدخول",
            color: MyColors.white,
            fontSize: 18.sp,
            fontWeight: FontWeight.w900,
          ),
          InkWell(
            onTap: () => SettingScreen.of(context)!.settingShow = false,
            child: Icon(
              FontAwesomeIcons.xmark,
              color: MyColors.yellow,
              size: 19.sp,
            ),
          ),
        ],
      ),
    );
  }

//facebook Button UI
  Container facebookButton() {
    return Container(
      width: 180.w,
      height: 35.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Text(
        'Facebook',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.sp,
          color: MyColors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

//google Button UI
  InkWell googleButton(BuildContext context) {
    void gogleLogIn(context) async {
      final user = await RegistrationWebServices.googlelogin();
      if (user == null) {
        Toast.show(
          'Sign in Faild',
          duration: 3,
          gravity: Toast.bottom,
        );
      } else {
        var res =
            BlocProvider.of<RegistrationCubit>(context).loginPlayerAccountByID(
          id: PlayerAccount.playerId!,
          name: user.displayName!,
          email: user.email,
          emailType: 'gmail',
        );
        if (res == true) {
          Toast.show(
            'تم التسجيل بنجاح',
            duration: 3,
            gravity: Toast.bottom,
          );
        }
      }
    }

    return InkWell(
      onTap: () => gogleLogIn(context),
      child: Container(
        width: 180.w,
        height: 35.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: BlocBuilder<RegistrationCubit, RegistrationState>(
            builder: (context, state) {
          if (state is AddingNewPlayerWithAccount)
            return Center(child: CircularProgressIndicator());
          return Text(
            'Google',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              color: MyColors.white,
              fontWeight: FontWeight.bold,
            ),
          );
        }),
      ),
    );
  }
}
