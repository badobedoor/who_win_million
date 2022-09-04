// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:who_win_million/constants/strings.dart';
import 'package:who_win_million/presentation/screens/home_screen.dart';
import 'package:who_win_million/presentation/screens/login_screen.dart';
import 'package:who_win_million/presentation/screens/onboarding_screen.dart';

import '../../business_logic/cubit/registration_cubit.dart';
import '../../business_logic/help/sharedPreferences.dart';
import '../widgets/containerWithCenterLogoBackgroundImage.dart';

class SplashScreen extends StatefulWidget {
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State {
  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_) {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future getStartData(BuildContext context) async {
    //الخطا فى الانتظاااار
    // BlocProvider.of<RegistrationCubit>(context).getPlayerNameByID(id: id);
    await NewSharedPreferences().getPlayerData();
    var isOnboardingScreenShowed =
        await NewSharedPreferences().getIsOnboardingScreenShowed();
    var isLoginScreenShowed =
        await NewSharedPreferences().getIsLoginScreenShowed();
    NewSharedPreferences.isSoundOn =
        await NewSharedPreferences().getIsSoundOn();

    await Future.delayed(const Duration(seconds: 3));
    if (isOnboardingScreenShowed == true && isLoginScreenShowed == true) {
      return const HomeScreen();
      // Navigator.pushNamed(context, homeScreen);
    } else if (isOnboardingScreenShowed == true &&
        isLoginScreenShowed == false) {
      return const LogInScreen();
      //Navigator.pushNamed(context, logInScreen);
    } else if (isOnboardingScreenShowed == false &&
        isLoginScreenShowed == false) {
      return const OnboardigScreen();
      //Navigator.pushNamed(context, onboardingScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getStartData(context),
      // initialData: InitialData,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return snapshot.data;
        } else {
          return ContainerWithCenterLogoBackgroundImage();
        }
      },
    ));
  }
}
