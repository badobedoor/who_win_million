import 'package:flutter/material.dart';
import 'constants/strings.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/leaderboard_screen.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/onboarding_screen.dart';
import 'presentation/screens/questions_screen.dart';
import 'presentation/screens/setting_screen.dart';

class AppRouter {
  Route? genarateRoute(RouteSettings settings) {
    // await res().then((value) => startscreen = value);
    // res();
    if (startscreen == '/home') {
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    } else if (startscreen == '/logIn') {
      return MaterialPageRoute(builder: (_) => const LogInScreen());
    } else if (startscreen == '/onboarding') {
      return MaterialPageRoute(builder: (_) => const OnboardigScreen());
    } else if (startscreen == '/') {
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    } else {
      switch (settings.name) {
        case homeScreen:
          return MaterialPageRoute(builder: (_) => const HomeScreen());
        case onboardingScreen:
          return MaterialPageRoute(builder: (_) => const OnboardigScreen());
        case logInScreen:
          return MaterialPageRoute(builder: (_) => const LogInScreen());
        case questionsScreen:
          return MaterialPageRoute(builder: (_) => const QuestionsScreen());
        case settingScreen:
          return MaterialPageRoute(builder: (_) => const SettingScreen());
        case leaderBoardScreen:
          return MaterialPageRoute(builder: (_) => const LeaderBordScreen());
      }
    }
  }
}
