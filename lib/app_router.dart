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
