import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:who_win_million/business_logic/cubit/registration_cubit.dart';
import 'package:who_win_million/data/repository/registration_repository.dart';
import 'constants/strings.dart';
import 'data/web_services/registration_web_services.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/leaderboard_screen.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/onboarding_screen.dart';
import 'presentation/screens/questions_screen.dart';
import 'presentation/screens/setting_screen.dart';

class AppRouter {
  late RegistrationRepository registrationRepository;

  late RegistrationCubit registrationCubit;
  AppRouter() {
    registrationRepository = RegistrationRepository(RegistrationWebServices());

    registrationCubit = RegistrationCubit(registrationRepository);
  }

  Route? genarateRoute(RouteSettings settings) {
    // await res().then((value) => startscreen = value);
    // res();
    // if (startscreen == '/home') {
    //   return MaterialPageRoute(builder: (_) => const HomeScreen());
    // } else if (startscreen == '/logIn') {
    //   return MaterialPageRoute(
    //     builder: (_) => BlocProvider(
    //       create: (BuildContext context) => createNewPlayerWithAccountCubitt,
    //       child: const LogInScreen(),
    //     ),
    //   );
    // } else if (startscreen == '/onboarding') {
    //   return MaterialPageRoute(builder: (_) => const OnboardigScreen());
    // } else {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardigScreen());
      case logInScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => registrationCubit,
              ),
              // BlocProvider(
              //   create: (_) => registrationCubit,
              // )
            ],
            child: const LogInScreen(),
          ),
        );

      case questionsScreen:
        return MaterialPageRoute(builder: (_) => const QuestionsScreen());
      case settingScreen:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case leaderBoardScreen:
        return MaterialPageRoute(builder: (_) => const LeaderBordScreen());
    }
  }
}
