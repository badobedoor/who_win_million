import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'app_router.dart';
import 'business_logic/provider/variablesProvider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // res().then((value) => startscreen = value);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((value) => runApp(MultiProvider(providers: [
        ChangeNotifierProvider<VariablesProvider>(
          create: (ctx) => VariablesProvider(),
        ),
      ], child: WinMillionApp(appRouter: AppRouter()))));
  runApp(WinMillionApp(appRouter: AppRouter()));
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // runApp(WinMillionApp(appRouter: AppRouter()));
}

class WinMillionApp extends StatelessWidget {
  final AppRouter appRouter;

  const WinMillionApp({Key? key, required this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(640, 360),
      // minTextAdapt: true,
      // splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          // home: ,
          theme: ThemeData(fontFamily: 'Almarai'),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.genarateRoute,
        );
      },
    );
  }
}
