// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:who_win_million/constants/strings.dart';

import '../../business_logic/help/sharedPreferences.dart';
import '../widgets/containerWithCenterLogoBackgroundImage.dart';

class SplashScreen extends StatefulWidget {
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getStartData(context);
    });
    // BlocProvider.of<RegistrationCubit>(context).getPlayerNameByID(id: id);
  }

  Future getStartData(BuildContext context) async {
    await NewSharedPreferences().getPlayerData();
    var isOnboardingScreenShowed =
        await NewSharedPreferences().getIsOnboardingScreenShowed();
    var isLoginScreenShowed =
        await NewSharedPreferences().getIsLoginScreenShowed();
    NewSharedPreferences.isSoundOn =
        await NewSharedPreferences().getIsSoundOn();

    await Future.delayed(const Duration(seconds: 2));
    if (isOnboardingScreenShowed == true && isLoginScreenShowed == true) {
      Navigator.pushNamed(context, homeScreen);
    } else if (isOnboardingScreenShowed == true &&
        isLoginScreenShowed == false) {
      Navigator.pushNamed(context, logInScreen);
    } else if (isOnboardingScreenShowed == false &&
        isLoginScreenShowed == false) {
      Navigator.pushNamed(context, onboardingScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ContainerWithCenterLogoBackgroundImage());
  }
}
