import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:who_win_million/business_logic/cubit/leaderbord_cubit.dart';
import 'package:who_win_million/business_logic/cubit/player_cubit.dart';
import 'package:who_win_million/business_logic/cubit/questions_cubit.dart';

import 'package:who_win_million/business_logic/cubit/registration_cubit.dart';
import 'package:who_win_million/data/repository/leaderbord_repository.dart';
import 'package:who_win_million/data/repository/questions_repository.dart';
import 'package:who_win_million/data/repository/registration_repository.dart';
import 'package:who_win_million/data/web_services/questions_web_Services.dart';
import 'package:who_win_million/presentation/screens/splashScreen.dart';
import 'constants/strings.dart';
import 'data/web_services/leaderboard_web_services.dart';
import 'data/web_services/registration_web_services.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/leaderboard_screen.dart';
import 'presentation/screens/login_screen.dart';
import 'presentation/screens/onboarding_screen.dart';
import 'presentation/screens/questions_screen.dart';
import 'presentation/screens/setting_screen.dart';

class AppRouter {
  late RegistrationRepository registrationRepository;
  late QuestionsRepository questionsRepository;
  late LeaderbordRepository leaderbordRepository;
  late LeaderboardCubit leaderboardCubit;
  late RegistrationCubit registrationCubit;
  late QuestionsCubit questionsCubit;
  late PlayerCubit playerCubit;

  AppRouter() {
    registrationRepository = RegistrationRepository(RegistrationWebServices());
    registrationCubit = RegistrationCubit(registrationRepository);
    questionsRepository = QuestionsRepository(QuestionsWebServices());
    leaderbordRepository =
        LeaderbordRepository(leaderbordWebServices: LeaderbordWebServices());
    leaderboardCubit = LeaderboardCubit(leaderbordRepository);
    playerCubit = PlayerCubit(leaderbordRepository);
    questionsCubit = QuestionsCubit(questionsRepository);
  }

  Route? genarateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case homeScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: registrationCubit,
              ),
              BlocProvider.value(
                value: leaderboardCubit,
              ),
              BlocProvider.value(
                value: questionsCubit,
              )
            ],
            child: const HomeScreen(),
          ),
        );
      case onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardigScreen());
      case logInScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: registrationCubit,
              ),
              // BlocProvider.value(
              //   value: registrationCubit,
              // )
            ],
            child: const LogInScreen(),
          ),
        );

      case questionsScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: questionsCubit,
            child: const QuestionsScreen(),
          ),
        );
      case settingScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: registrationCubit,
            child: const SettingScreen(),
          ),
        );
      case leaderBoardScreen:
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: leaderboardCubit,
              ),
              BlocProvider.value(
                value: playerCubit,
              )
            ],
            child: const LeaderBordScreen(),
          ),
        );
    }
  }
}
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
