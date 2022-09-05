import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:toast/toast.dart';

import '../../data/web_services/registration_web_services.dart';
import '../cubit/registration_cubit.dart';

class LoginScreenFunctions {
  static void gogleSigIn(context) async {
    final user = await RegistrationWebServices.googlelogin();
    if (user == null) {
      Toast.show(
        'Sign in Faild',
        duration: 3,
        gravity: Toast.bottom,
      );
    } else {
      var res = BlocProvider.of<RegistrationCubit>(context)
          .createNewPlayerWithAccount(
        name: user.displayName!,
        email: user.email,
        emailType: 'gmail',
      );
      if (res == true)
        Toast.show(
          'تم التسجيل بنجاح',
          duration: 3,
          gravity: Toast.bottom,
        );
    }
  }

  static void faceBookSigIn(context) async {
    final result =
        await FacebookAuth.i.login(permissions: ["public_profile", "email"]);
    // await FacebookAuth.i.login();

    if (result.status == LoginStatus.success) {
      final userData = await FacebookAuth.i.getUserData(
        fields: "email,name",
      );

      var res = BlocProvider.of<RegistrationCubit>(context)
          .createNewPlayerWithAccount(
        name: userData['name'],
        email: userData['email'],
        emailType: 'facebook',
      );
      if (res == true)
        Toast.show(
          'تم التسجيل بنجاح',
          duration: 3,
          gravity: Toast.bottom,
        );
    } else {
      Toast.show(
        'Sign in Faild',
        duration: 3,
        gravity: Toast.bottom,
      );
    }
  }

  static void createAnonymousNewPlayer(context) async {
    var res =
        await BlocProvider.of<RegistrationCubit>(context).createNewPlayer();
    if (res == true) {
      Toast.show(
        'تم التسجيل بنجاح',
        duration: 2,
        gravity: Toast.bottom,
      );
    }
  }
}
