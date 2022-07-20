// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:who_win_million/constants/my_colors.dart';
import 'package:who_win_million/constants/strings.dart';
import 'package:who_win_million/presentation/widgets/container_with_logo_background_image.dart';

import '../../business_logic/cubit/sharedPreferences.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ContainerWithLogoBackgroundImage(
      child: Padding(
        padding: EdgeInsets.only(right: 47.w, top: 110.h),
        child: Container(
          // color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'تسجيل الدخول',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 20.sp,
                  color: MyColors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 28.h),
              Container(
                width: 180.w,
                height: 35.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Text(
                  'Google',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: MyColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Container(
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
              ),
              SizedBox(height: 58.h),
              InkWell(
                onTap: () {
                  NewSharedPreferences().setIsLoginScreenShowed(true);
                  startscreen = 'next';
                  Navigator.pushNamed(context, homeScreen);
                },
                child: Text(
                  'تخطى',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: MyColors.yellow,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

// import 'package:flutter/material.dart';
// // import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:who_will_win_the_million/presentation/screens/home_screen.dart';

// import '../../data/web_services/google_signIn_api.dart';

// class LogInScreen extends StatefulWidget {
//   const LogInScreen({Key? key}) : super(key: key);

//   @override
//   State<LogInScreen> createState() => _LogInScreenState();
// }

// class _LogInScreenState extends State<LogInScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // Map? _userData;
//     Future sigIn() async {
//       final user = await GoogleSignInApi.login();
//       if (user == null) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text('Sign in Faild')));
//       } else {
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (context) => HomeScreen(user: user),
//           ),
//         );
//       }
//     }

//     // Future facebookSigIn() async {
//     //   // final result =
//     //   //     await FacebookAuth.i.login(permissions: ["public_profile", "email"]);

//     //   // if (result.status == LoginStatus.success) {
//     //   //   final userData = await FacebookAuth.i.getUserData(
//     //   //     fields: "email,name",
//     //   //   );

//     //     setState(() {
//     //       // _userData = userData;
//     //     });
//     //   }
//     // }

//     // Future facebookLogOut() async {
//     //   // await FacebookAuth.i.logOut();

//     //   setState(() {
//     //     // _userData = null;
//     //   });
//     // }

//     return Scaffold(
//       appBar: AppBar(title: Text('test')),
//       // 'Facebook (Logged ' + (_userData == null ? 'Out' : 'In') + ')')),
//       body: Container(
//         color: Colors.black38,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: ElevatedButton.icon(
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.white,
//                   onPrimary: Colors.black,
//                   minimumSize: Size(double.infinity, 50),
//                 ),
//                 icon: FaIcon(
//                   FontAwesomeIcons.google,
//                   color: Colors.red,
//                 ),
//                 label: Text('Sign Up with Google'),
//                 onPressed: sigIn,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.white,
//                     onPrimary: Colors.black,
//                     minimumSize: Size(double.infinity, 50),
//                   ),
//                   icon: FaIcon(
//                     FontAwesomeIcons.facebook,
//                     color: Colors.blue,
//                   ),
//                   label: Text('Sign Up with FaceBook'),
//                   onPressed: () {} //facebookSigIn,
//                   ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(18.0),
//               child: ElevatedButton.icon(
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.white,
//                     onPrimary: Colors.black,
//                     minimumSize: Size(double.infinity, 50),
//                   ),
//                   icon: FaIcon(
//                     FontAwesomeIcons.facebook,
//                     color: Colors.blue,
//                   ),
//                   label: Text('Log Out with FaceBook'),
//                   onPressed: () {} // facebookLogOut,
//                   ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
