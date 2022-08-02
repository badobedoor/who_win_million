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

class AccountSettingsContainer extends StatelessWidget {
  AccountSettingsContainer({
    Key? key,
  }) : super(key: key);
  var nameController = TextEditingController();
  var id = PlayerAccount.playerId!;
  var playerEmail = PlayerAccount.playerEmail;
  var playerName = PlayerAccount.playerName;
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    nameController.text = playerName ?? '';
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
            NormalText(
              text: playerEmail!,
              color: MyColors.darkGreen,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
            16.verticalSpace,
            playerNameTextField(nameController),
            16.verticalSpace,
            horizontalLine(),
            16.verticalSpace,
            logoutButton(context),
          ]),
        ),
      ),
    );
  }

  Future<void> saveShanges({required BuildContext context}) async {
    if (nameController.text.isEmpty || nameController.text == playerName) {
      Toast.show(
        'من فضلك تاكد من انك ادخلت اسم جديد',
        duration: 3,
        gravity: Toast.bottom,
      );
    } else {
      BlocProvider.of<RegistrationCubit>(context)
          .updatePlayerName(id: id, playerName: nameController.text);
      await NewSharedPreferences().getPlayerData();
      SettingScreen.of(context)!.settingShow = false;
      Toast.show(
        'تم التعديل بنجاح',
        duration: 3,
        gravity: Toast.bottom,
      );
    }
  }

//heder Section badding and Title and save changes Btn and close Button
  Padding hederSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 23.h, left: 25.w, right: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.rtl,
        children: [
          InkWell(
            onTap: () => saveShanges(context: context),
            child: Icon(
              FontAwesomeIcons.check,
              color: MyColors.yellow,
              size: 19.sp,
            ),
          ),
          NormalText(
            text: "إعدادات الحساب",
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

//player Name Text Field UI
  Container playerNameTextField(TextEditingController nameController) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: MyColors.black.withOpacity(0.25),
          spreadRadius: 0,
          blurRadius: 4,
          offset: Offset(0, 4), // changes position of shadow
        ),
      ]),
      width: 169.w,
      height: 35.h,
      child: TextFormField(
        controller: nameController,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 6.h, right: 16.w, left: 16.w),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.sp),
            ),
            filled: true,
            hintStyle: const TextStyle(color: MyColors.darkGreen),
            hintText: "...ادخل اسمك", //playerName ??
            fillColor: MyColors.white),
      ),
    );
  }

// -----------or ---------- UI
  Row horizontalLine() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 1.h,
          width: 70.w,
          color: MyColors.darkGreen,
        ),
        7.horizontalSpace,
        NormalText(
          text: "أو",
          color: MyColors.darkGreen,
          fontSize: 16.sp,
          fontWeight: FontWeight.w700,
        ),
        7.horizontalSpace,
        Container(
          height: 1.h,
          width: 70.w,
          color: MyColors.darkGreen,
        ),
      ],
    );
  }

// logout Button UI
  LinearButton logoutButton(BuildContext context) {
    return LinearButton(
      ontap: () {
        //set IsLogin Screen not Showed
        NewSharedPreferences().setIsLoginScreenShowed(false);
        //google log out
        RegistrationWebServices.googlelogout();
        //clean player data
        NewSharedPreferences().clearPlayerData();
        //close Account settings
        SettingScreen.of(context)!.settingShow = false;
        //navgator to login Screen
        Navigator.pushReplacementNamed(context, logInScreen);
      },
      width: 169,
      height: 35,
      borderRadius: 10,
      child: NormalText(
        text: "تسجيل الخروج",
        color: MyColors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
