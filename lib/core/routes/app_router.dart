import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:market/core/di/dependency_injection.dart';
import 'package:market/core/routes/routes.dart';
import 'package:market/features/home/home_screen.dart';
import 'package:market/features/login/logic/cubit/login_cubit.dart';
import 'package:market/features/login/ui/screens/login_screen.dart';
import 'package:market/features/onboarding/ui/screens/onboarding_screen.dart';
import 'package:market/features/signup/logic/cubit/sign_up_cubit.dart';

import '../../features/signup/ui/screens/sign_up_dcreen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    // Extract the route name from the settings.
    final String routeName = settings.name!;

    switch (routeName) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );

      case Routes.signupScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpScrren(),
          ),
        );

      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
    }

    return null;
  }
}
