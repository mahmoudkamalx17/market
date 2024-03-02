// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:market/core/database/cache_helper.dart';
import 'package:market/core/routes/app_router.dart';
import 'package:market/core/routes/routes.dart';

class MarketiApp extends StatelessWidget {
  MarketiApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  dynamic onBoarding = CacheHelper().getData(key: Routes.onBoardingScreen);
  dynamic login = CacheHelper().getData(key: Routes.loginScreen);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: sharedStartApp(),
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }

  String sharedStartApp() {
    if (login == true) {
      return Routes.homeScreen;
    } else if (onBoarding == true) {
      return Routes.loginScreen;
    } else {
      return Routes.onBoardingScreen;
    }
  }
}
