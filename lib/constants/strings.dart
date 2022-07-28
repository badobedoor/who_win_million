import '../business_logic/help/sharedPreferences.dart';

const baseUrl = 'https://islamquestions.herokuapp.com/api/';

// Future<String> res() async {
//   bool isOnboardingScreenShowed =
//       await NewSharedPreferences().getIsOnboardingScreenShowed();
//   bool isLoginScreenShowed =
//       await NewSharedPreferences().getIsLoginScreenShowed();

//   var res = isOnboardingScreenShowed
//       ? isLoginScreenShowed
//           ? '/home'
//           : '/logIn'
//       : '/onboarding';
//   startscreen = res;
//   return res;
// }

// String startscreen = '/';

const onboardingScreen = '/';
const logInScreen = '/logIn';
const homeScreen = '/home';
const questionsScreen = '/questions';
const settingScreen = '/setting';
const leaderBoardScreen = '/leader_board';
